import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Catálogo de parámetros clínicos — conversiones canónicas', () {
    late Map<String, dynamic> catalog;

    setUpAll(() async {
      final raw = await rootBundle.loadString('assets/data/parametros_clinicos.json');
      catalog = json.decode(raw) as Map<String, dynamic>;
    });

    test('el catálogo tiene versión', () {
      expect(catalog['version'], isA<int>());
      expect(catalog['version'], greaterThan(0));
    });

    test('todos los parámetros tienen código, nombre_i18n y unidad_canonica', () {
      final params = catalog['parametros'] as List;
      for (final p in params) {
        final map = p as Map<String, dynamic>;
        expect(map['codigo'], isA<String>(), reason: 'sin código: $map');
        expect(map['nombre_i18n'], isA<Map>(), reason: 'sin nombre_i18n: ${map['codigo']}');
        final i18n = map['nombre_i18n'] as Map;
        expect(i18n.containsKey('es'), isTrue, reason: 'falta es: ${map['codigo']}');
        expect(i18n.containsKey('en'), isTrue, reason: 'falta en: ${map['codigo']}');
        expect(i18n.containsKey('fr'), isTrue, reason: 'falta fr: ${map['codigo']}');
        expect(map['unidad_canonica'], isA<String>(), reason: 'sin unidad_canonica: ${map['codigo']}');
      }
    });

    test('creatinina: conversión umol/L → mg/dL correcta', () {
      final params = catalog['parametros'] as List;
      final creat = params.firstWhere((p) => (p as Map)['codigo'] == 'creatinina_serica') as Map;
      final unidades = creat['unidades_aceptadas'] as List;
      final umolConv = unidades.firstWhere((u) => (u as Map)['unidad'] == 'umol/L') as Map;
      final factor = (umolConv['factor_a_canonica'] as num).toDouble();
      // 88.4 umol/L ≈ 1.0 mg/dL
      expect(88.4 * factor, closeTo(1.0, 0.01));
    });

    test('glicemia: conversión mmol/L → mg/dL correcta', () {
      final params = catalog['parametros'] as List;
      final glic = params.firstWhere((p) => (p as Map)['codigo'] == 'glicemia') as Map;
      final unidades = glic['unidades_aceptadas'] as List;
      final mmolConv = unidades.firstWhere((u) => (u as Map)['unidad'] == 'mmol/L') as Map;
      final factor = (mmolConv['factor_a_canonica'] as num).toDouble();
      // 5.56 mmol/L ≈ 100 mg/dL
      expect(5.56 * factor, closeTo(100.0, 1.0));
    });

    test('urea: BUN_mg/dL → urea_mg/dL correcta', () {
      final params = catalog['parametros'] as List;
      final urea = params.firstWhere((p) => (p as Map)['codigo'] == 'urea_serica') as Map;
      final unidades = urea['unidades_aceptadas'] as List;
      final bunConv = unidades.firstWhere((u) => (u as Map)['unidad'] == 'BUN_mg/dL') as Map;
      final factor = (bunConv['factor_a_canonica'] as num).toDouble();
      // 10 BUN mg/dL × 2.1429 ≈ 21.4 urea mg/dL
      expect(10.0 * factor, closeTo(21.4, 0.1));
    });

    test('sodio: mEq/L y mmol/L son la misma unidad (factor = 1)', () {
      final params = catalog['parametros'] as List;
      final na = params.firstWhere((p) => (p as Map)['codigo'] == 'sodio') as Map;
      final unidades = na['unidades_aceptadas'] as List;
      for (final u in unidades) {
        final um = u as Map;
        expect((um['factor_a_canonica'] as num).toDouble(), closeTo(1.0, 0.001));
      }
    });

    test('temperatura: conversión °F → °C correcta (37°C = 98.6°F)', () {
      final params = catalog['parametros'] as List;
      final temp = params.firstWhere((p) => (p as Map)['codigo'] == 'temperatura') as Map;
      final unidades = temp['unidades_aceptadas'] as List;
      final fConv = unidades.firstWhere((u) => (u as Map)['unidad'] == '°F') as Map;
      final factor = (fConv['factor_a_canonica'] as num).toDouble();
      final offset = (fConv['offset'] as num).toDouble();
      // 98.6 °F → °C: 98.6 * 0.5556 + (-17.778) ≈ 37.0
      expect(98.6 * factor + offset, closeTo(37.0, 0.1));
    });

    test('el catálogo cubre al menos 20 parámetros núcleo nefro/UCI', () {
      final params = catalog['parametros'] as List;
      expect(params.length, greaterThanOrEqualTo(20));
    });

    test('todos los factores de conversión son numéricos y positivos o cero', () {
      final params = catalog['parametros'] as List;
      for (final p in params) {
        final map = p as Map<String, dynamic>;
        final unidades = map['unidades_aceptadas'] as List;
        for (final u in unidades) {
          final um = u as Map;
          final factor = (um['factor_a_canonica'] as num).toDouble();
          expect(factor, greaterThanOrEqualTo(0), reason: 'factor negativo en ${map['codigo']}');
        }
      }
    });
  });
}
