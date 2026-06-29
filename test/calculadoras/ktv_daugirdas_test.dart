import 'package:flutter_test/flutter_test.dart';
import 'package:inef_uci/domain/usecases/calculadoras/ktv_daugirdas_usecase.dart';

void main() {
  group('KtvDaugirdasEngine', () {
    // Caso 1: valores conocidos con Kt/V adecuado
    // R = 40/120 = 0.333, t = 4h, UF = 2.5L, W = 70kg
    // Kt/V = -ln(0.333 - 0.032) + (4 - 3.5*0.333)*2.5/70
    //      = -ln(0.301) + (4 - 1.167)*0.0357
    //      = 1.200 + 0.101 ≈ 1.301
    test('caso adecuado: Kt/V >= 1.2', () {
      final inputs = KtvInputs(
        ureaPre: const KtvVariable(value: 120, origin: VariableOrigin.manual),
        ureaPost: const KtvVariable(value: 40, origin: VariableOrigin.manual),
        duracionH: const KtvVariable(value: 4.0, origin: VariableOrigin.manual),
        ufLitros: const KtvVariable(value: 2.5, origin: VariableOrigin.manual),
        pesoPostKg: const KtvVariable(value: 70.0, origin: VariableOrigin.manual),
      );
      final result = KtvDaugirdasEngine.calculate(
        ureaPre: 120,
        ureaPost: 40,
        duracionH: 4.0,
        ufLitros: 2.5,
        pesoPostKg: 70.0,
        inputs: inputs,
      );
      expect(result.ktv, greaterThan(1.2));
      expect(result.isAdequate, isTrue);
      // URR = (1 - 40/120) * 100 = 66.7 %
      expect(result.urr, closeTo(66.7, 0.5));
    });

    // Caso 2: Kt/V inadecuado (sesión corta con poca depuración)
    test('caso inadecuado: Kt/V < 1.2', () {
      final inputs = KtvInputs(
        ureaPre: const KtvVariable(value: 100, origin: VariableOrigin.manual),
        ureaPost: const KtvVariable(value: 70, origin: VariableOrigin.manual),
        duracionH: const KtvVariable(value: 2.0, origin: VariableOrigin.manual),
        ufLitros: const KtvVariable(value: 1.0, origin: VariableOrigin.manual),
        pesoPostKg: const KtvVariable(value: 80.0, origin: VariableOrigin.manual),
      );
      final result = KtvDaugirdasEngine.calculate(
        ureaPre: 100,
        ureaPost: 70,
        duracionH: 2.0,
        ufLitros: 1.0,
        pesoPostKg: 80.0,
        inputs: inputs,
      );
      expect(result.ktv, lessThan(1.2));
      expect(result.isAdequate, isFalse);
    });

    // Caso 3: Kt/V exactamente en el límite (caso de prueba de precisión)
    test('formula tiene componente logarítmico correcto', () {
      // R = 0.5, t = 4, UF = 0, W = 70
      // Kt/V = -ln(0.5 - 0.032) + (4 - 1.75) * 0 = -ln(0.468) ≈ 0.759
      final inputs = KtvInputs(
        ureaPre: const KtvVariable(value: 100, origin: VariableOrigin.manual),
        ureaPost: const KtvVariable(value: 50, origin: VariableOrigin.manual),
        duracionH: const KtvVariable(value: 4.0, origin: VariableOrigin.manual),
        ufLitros: const KtvVariable(value: 0.0, origin: VariableOrigin.manual),
        pesoPostKg: const KtvVariable(value: 70.0, origin: VariableOrigin.manual),
      );
      final result = KtvDaugirdasEngine.calculate(
        ureaPre: 100,
        ureaPost: 50,
        duracionH: 4.0,
        ufLitros: 0.0,
        pesoPostKg: 70.0,
        inputs: inputs,
      );
      // -ln(0.468) ≈ 0.759
      expect(result.ktv, closeTo(0.759, 0.01));
    });

    // Caso 4: validación — urea_post >= urea_pre debe lanzar error
    test('lanza ArgumentError si urea_post >= urea_pre', () {
      final inputs = KtvInputs(
        ureaPre: const KtvVariable(value: 50, origin: VariableOrigin.manual),
        ureaPost: const KtvVariable(value: 60, origin: VariableOrigin.manual),
        duracionH: const KtvVariable(value: 4.0, origin: VariableOrigin.manual),
        ufLitros: const KtvVariable(value: 2.0, origin: VariableOrigin.manual),
        pesoPostKg: const KtvVariable(value: 70.0, origin: VariableOrigin.manual),
      );
      expect(
        () => KtvDaugirdasEngine.calculate(
          ureaPre: 50,
          ureaPost: 60,
          duracionH: 4.0,
          ufLitros: 2.0,
          pesoPostKg: 70.0,
          inputs: inputs,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    // Caso 5: KtvInputs detecta campos faltantes
    test('KtvInputs.missingFields detecta variables sin valor', () {
      final inputs = KtvInputs(
        ureaPre: const KtvVariable(value: 120, origin: VariableOrigin.manual),
        ureaPost: const KtvVariable(origin: VariableOrigin.missing),
        duracionH: const KtvVariable(origin: VariableOrigin.missing),
        ufLitros: const KtvVariable(value: 2.0, origin: VariableOrigin.manual),
        pesoPostKg: const KtvVariable(origin: VariableOrigin.missing),
      );
      expect(inputs.isComplete, isFalse);
      expect(inputs.missingFields, containsAll(['ureaPost', 'duracionH', 'pesoPostKg']));
      expect(inputs.missingFields.length, 3);
    });
  });
}
