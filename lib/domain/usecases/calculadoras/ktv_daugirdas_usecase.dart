import 'dart:math';
import 'package:inef_uci/data/database/app_database.dart';

enum VariableOrigin { autoLab, autoHd, manual, missing }

class KtvVariable {
  final double? value;
  final VariableOrigin origin;
  final DateTime? sourceDateTime;

  const KtvVariable({
    this.value,
    required this.origin,
    this.sourceDateTime,
  });

  bool get hasValue => value != null;
}

class KtvInputs {
  final KtvVariable ureaPre;    // mg/dL (urea sérica pre-diálisis)
  final KtvVariable ureaPost;   // mg/dL (urea sérica post-diálisis)
  final KtvVariable duracionH;  // horas de sesión
  final KtvVariable ufLitros;   // ultrafiltración total en litros
  final KtvVariable pesoPostKg; // peso post-diálisis en kg

  const KtvInputs({
    required this.ureaPre,
    required this.ureaPost,
    required this.duracionH,
    required this.ufLitros,
    required this.pesoPostKg,
  });

  List<String> get missingFields {
    final missing = <String>[];
    if (!ureaPre.hasValue) missing.add('ureaPre');
    if (!ureaPost.hasValue) missing.add('ureaPost');
    if (!duracionH.hasValue) missing.add('duracionH');
    if (!ufLitros.hasValue) missing.add('ufLitros');
    if (!pesoPostKg.hasValue) missing.add('pesoPostKg');
    return missing;
  }

  bool get isComplete => missingFields.isEmpty;
}

class KtvResult {
  final double ktv;
  final double urr;
  final bool isAdequate; // Kt/V >= 1.2
  final KtvInputs inputs;

  const KtvResult({
    required this.ktv,
    required this.urr,
    required this.isAdequate,
    required this.inputs,
  });
}

/// Motor puro Kt/V Daugirdas II.
///
/// Fórmula: Kt/V = -ln(R - 0.008·t) + (4 - 3.5·R)·UF/W
///   R  = urea_post / urea_pre
///   t  = duración en horas
///   UF = ultrafiltración en litros
///   W  = peso post-diálisis en kg
///
/// URR = (1 - R) * 100 %
class KtvDaugirdasEngine {
  static const double adequacyThreshold = 1.2;

  /// Calcula Kt/V y URR. Lanza [ArgumentError] si los valores son fisiológicamente inválidos.
  static KtvResult calculate({
    required double ureaPre,
    required double ureaPost,
    required double duracionH,
    required double ufLitros,
    required double pesoPostKg,
    required KtvInputs inputs,
  }) {
    _validate(ureaPre, ureaPost, duracionH, ufLitros, pesoPostKg);

    final R = ureaPost / ureaPre;
    final t = duracionH;
    final uf = ufLitros;
    final W = pesoPostKg;

    final ktv = -log(R - 0.008 * t) + (4.0 - 3.5 * R) * (uf / W);
    final urr = (1.0 - R) * 100.0;

    return KtvResult(
      ktv: ktv,
      urr: urr,
      isAdequate: ktv >= adequacyThreshold,
      inputs: inputs,
    );
  }

  static void _validate(
    double ureaPre,
    double ureaPost,
    double duracionH,
    double ufLitros,
    double pesoPostKg,
  ) {
    if (ureaPre <= 0) throw ArgumentError('urea_pre debe ser > 0');
    if (ureaPost <= 0) throw ArgumentError('urea_post debe ser > 0');
    if (ureaPost >= ureaPre) {
      throw ArgumentError('urea_post debe ser < urea_pre para Kt/V positivo');
    }
    if (duracionH <= 0 || duracionH > 12) {
      throw ArgumentError('duración debe estar entre 0 y 12 horas');
    }
    if (ufLitros < 0 || ufLitros > 10) {
      throw ArgumentError('UF debe estar entre 0 y 10 litros');
    }
    if (pesoPostKg <= 0 || pesoPostKg > 300) {
      throw ArgumentError('peso_post debe ser > 0 y <= 300 kg');
    }
    final R = ureaPost / ureaPre;
    final innerLog = R - 0.008 * duracionH;
    if (innerLog <= 0) {
      throw ArgumentError(
          'R - 0.008·t = $innerLog ≤ 0: la fórmula de Daugirdas no es aplicable con estos valores');
    }
  }
}

/// Use case: carga los datos desde la HC y la última sesión HD,
/// construye KtvInputs con tracking de origen, y ejecuta el motor.
class KtvDaugirdasUseCase {
  final AppDatabase _db;

  KtvDaugirdasUseCase(this._db);

  Future<KtvInputs> autopoblar(int pacienteId) async {
    final ureaPreLab = await _db.getLastLabValue(pacienteId, 'urea_serica');
    final ureaPostLab = await _db.getLastLabValue(pacienteId, 'urea_serica');
    // En contexto real: urea_pre = lab antes de HD, urea_post = lab después de HD.
    // El origen se distingue por la sesión HD. Aquí cargamos desde el lab más reciente
    // y la última sesión HD para los datos de sesión.
    final lastHd = await _db.getLastHdSession(pacienteId);

    return KtvInputs(
      ureaPre: _labToVar(ureaPreLab, suffix: 'pre'),
      ureaPost: _labToVar(ureaPostLab, suffix: 'post'),
      duracionH: lastHd != null
          ? KtvVariable(
              value: (lastHd.duracionRealMin ?? lastHd.duracionProgramadaMin) / 60.0,
              origin: VariableOrigin.autoHd,
              sourceDateTime: lastHd.fechaHoraInicio,
            )
          : const KtvVariable(origin: VariableOrigin.missing),
      ufLitros: lastHd?.ufTotalRealMl != null
          ? KtvVariable(
              value: lastHd!.ufTotalRealMl! / 1000.0,
              origin: VariableOrigin.autoHd,
              sourceDateTime: lastHd.fechaHoraInicio,
            )
          : const KtvVariable(origin: VariableOrigin.missing),
      pesoPostKg: lastHd?.pesoPostHdKg != null
          ? KtvVariable(
              value: lastHd!.pesoPostHdKg,
              origin: VariableOrigin.autoHd,
              sourceDateTime: lastHd.fechaHoraInicio,
            )
          : const KtvVariable(origin: VariableOrigin.missing),
    );
  }

  KtvVariable _labToVar(Laboratorio? lab, {String? suffix}) {
    if (lab == null) return const KtvVariable(origin: VariableOrigin.missing);
    return KtvVariable(
      value: lab.valorCanonicoMgDl,
      origin: VariableOrigin.autoLab,
      sourceDateTime: lab.fechaHora,
    );
  }

  KtvResult? calcular(KtvInputs inputs) {
    if (!inputs.isComplete) return null;
    try {
      return KtvDaugirdasEngine.calculate(
        ureaPre: inputs.ureaPre.value!,
        ureaPost: inputs.ureaPost.value!,
        duracionH: inputs.duracionH.value!,
        ufLitros: inputs.ufLitros.value!,
        pesoPostKg: inputs.pesoPostKg.value!,
        inputs: inputs,
      );
    } on ArgumentError {
      return null;
    }
  }
}
