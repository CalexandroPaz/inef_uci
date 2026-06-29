// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'INEF UCI';

  @override
  String get institutionName =>
      'Instituto de Nefrología Dr. Abelardo Buch López';

  @override
  String get institutionSubtitle =>
      'Instituto de Nefrología Dr. Abelardo Buch López';

  @override
  String get exclusiveUseNotice =>
      'Uso exclusivo del Instituto de Nefrología Dr. Abelardo Buch López. Prohibida su distribución fuera de la institución.';

  @override
  String get clinicalDisclaimer =>
      'Herramienta de apoyo clínico. No sustituye el juicio profesional. No es un dispositivo médico certificado.';

  @override
  String get loginTitle => 'Acceso INEF UCI';

  @override
  String get loginSubtitle => 'Ingrese su PIN para continuar';

  @override
  String get pinLabel => 'PIN (6 dígitos)';

  @override
  String get pinConfirm => 'Confirmar PIN';

  @override
  String get pinSetupTitle => 'Configurar PIN de acceso';

  @override
  String get pinSetupSubtitle =>
      'Elija un PIN de 6 dígitos para proteger sus datos';

  @override
  String get useBiometrics => 'Usar huella digital';

  @override
  String get biometricsPrompt => 'Autentíquese para acceder a INEF UCI';

  @override
  String get incorrectPin => 'PIN incorrecto';

  @override
  String attemptsRemaining(int count) {
    return '$count intentos restantes';
  }

  @override
  String get accountLocked => 'Acceso bloqueado temporalmente';

  @override
  String get patientsTitle => 'Pacientes';

  @override
  String get searchPatients => 'Buscar paciente...';

  @override
  String get filterService => 'Servicio';

  @override
  String get filterStatus => 'Estado';

  @override
  String get statusActive => 'Activo';

  @override
  String get statusDischarged => 'Egresado';

  @override
  String get statusDeceased => 'Fallecido';

  @override
  String get noPatients => 'No hay pacientes registrados';

  @override
  String get newPatient => 'Nuevo paciente';

  @override
  String get patientDetailTitle => 'Historia Clínica';

  @override
  String get generalData => 'Datos generales';

  @override
  String get clinicalHistory => 'Antecedentes';

  @override
  String get episodes => 'Episodios';

  @override
  String get labs => 'Laboratorio';

  @override
  String get vitals => 'Signos vitales';

  @override
  String get images => 'Imágenes';

  @override
  String get ekg => 'EKG';

  @override
  String get ventilation => 'Ventilación mecánica';

  @override
  String get hemodialysis => 'Hemodiálisis';

  @override
  String get calculators => 'Calculadoras';

  @override
  String get calculatorsTitle => 'Calculadoras médicas';

  @override
  String get ktvTitle => 'Kt/V Daugirdas II';

  @override
  String get ktvDescription => 'Eficacia de hemodiálisis';

  @override
  String ktvResult(String value) {
    return 'Kt/V = $value';
  }

  @override
  String get ktvAdequate => 'Adecuado (≥ 1.2)';

  @override
  String get ktvInadequate => 'Inadecuado (< 1.2)';

  @override
  String get fieldUreaPre => 'Urea pre-diálisis';

  @override
  String get fieldUreaPost => 'Urea post-diálisis';

  @override
  String get fieldDuration => 'Duración de sesión (minutos)';

  @override
  String get fieldUfVolume => 'Ultrafiltración total (L)';

  @override
  String get fieldWeightPost => 'Peso post-diálisis (kg)';

  @override
  String get fieldUrr => 'URR (%)';

  @override
  String get calculate => 'Calcular';

  @override
  String get exportPdf => 'Exportar PDF';

  @override
  String get saveResult => 'Guardar resultado';

  @override
  String get resultSaved => 'Resultado guardado';

  @override
  String originAutoLab(String datetime) {
    return 'Auto: Lab del $datetime';
  }

  @override
  String originAutoHd(String datetime) {
    return 'Auto: Última sesión HD del $datetime';
  }

  @override
  String get originManual => 'Editado manualmente';

  @override
  String get originMissing => 'Sin dato';

  @override
  String warningOutOfRange(String min, String max, String unit) {
    return 'Valor fuera del rango fisiológico ($min–$max $unit). ¿Confirmar?';
  }

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String get back => 'Atrás';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get languageEs => 'Español';

  @override
  String get languageEn => 'English';

  @override
  String get languageFr => 'Français';

  @override
  String get lockTimeout => 'Bloqueo automático';

  @override
  String get lockTimeout5min => '5 minutos';

  @override
  String get lockTimeout10min => '10 minutos';

  @override
  String get lockTimeout15min => '15 minutos';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String appVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get auditLogTitle => 'Registro de auditoría';

  @override
  String get pdfHeaderGenerated => 'Generado por INEF UCI';

  @override
  String pdfPage(int n, int total) {
    return 'Página $n de $total';
  }

  @override
  String get epiTitle => 'Epidemiología';

  @override
  String get epiLra3 => 'LRA KDIGO 3 por rango/servicio';

  @override
  String get epiMortality => 'Mortalidad con SOFA inicial ≥ umbral';

  @override
  String get epiKtvAvg => 'Kt/V promedio por dializador';

  @override
  String get epiComingSoon => 'Consultas epidemiológicas disponibles en v2.0';

  @override
  String get hdAccessFav => 'FAV radiocefálica';

  @override
  String get hdAccessFavBrachio => 'FAV braquiocefálica';

  @override
  String get hdAccessFavBrachiobasilic => 'FAV braquiobasílica';

  @override
  String get hdAccessGraft => 'Injerto';

  @override
  String get hdAccessJugular => 'Catéter yugular';

  @override
  String get hdAccessFemoral => 'Catéter femoral';

  @override
  String get hdAccessSubclavian => 'Catéter subclavio';

  @override
  String get hdAccessTransient => 'Transitorio';

  @override
  String get hdAccessTunneled => 'Tunelizado';

  @override
  String get ventModeVcCmv => 'VC-CMV';

  @override
  String get ventModeVcAc => 'VC-AC';

  @override
  String get ventModePcAc => 'PC-AC';

  @override
  String get ventModePcCmv => 'PC-CMV';

  @override
  String get ventModeSimv => 'SIMV';

  @override
  String get ventModePsv => 'PSV';

  @override
  String get ventModeCpap => 'CPAP';

  @override
  String get ventModeAutoflow => 'AutoFlow';

  @override
  String get ventModeAprv => 'PC-APRV';

  @override
  String get fieldHc => 'No. Historia Clínica';

  @override
  String get fieldFullName => 'Nombre completo';

  @override
  String get fieldCedula => 'Cédula de identidad';

  @override
  String get fieldBirthDate => 'Fecha de nacimiento';

  @override
  String get fieldSex => 'Sexo';

  @override
  String get fieldBloodGroup => 'Grupo sanguíneo';

  @override
  String get fieldRhFactor => 'Factor Rh';

  @override
  String get fieldDryWeight => 'Peso seco (kg)';

  @override
  String get fieldCurrentWeight => 'Peso actual (kg)';

  @override
  String get fieldHeight => 'Talla (cm)';

  @override
  String get fieldService => 'Servicio';

  @override
  String get fieldAdmissionDate => 'Fecha de ingreso';

  @override
  String get fieldAdmissionReason => 'Motivo de ingreso';

  @override
  String get sexMale => 'Masculino';

  @override
  String get sexFemale => 'Femenino';

  @override
  String get fieldRequired => 'Campo obligatorio';

  @override
  String get patientSaved => 'Paciente registrado';

  @override
  String get patientUpdated => 'Paciente actualizado';

  @override
  String get duplicateHc => 'Número de HC ya existe';

  @override
  String get lockApp => 'Bloquear';

  @override
  String get selectDate => 'Seleccionar fecha';

  @override
  String noSearchResults(String query) {
    return 'Sin resultados para \"$query\"';
  }

  @override
  String ageYears(int years) {
    return '$years años';
  }

  @override
  String get tabData => 'Datos';

  @override
  String get newVitalSigns => 'Nuevo SV';

  @override
  String get vitalsSaved => 'Signos vitales guardados';

  @override
  String get fieldFc => 'Frec. cardíaca (lpm)';

  @override
  String get fieldBpSystolic => 'PA sistólica (mmHg)';

  @override
  String get fieldBpDiastolic => 'PA diastólica (mmHg)';

  @override
  String get fieldMap => 'PAM (mmHg)';

  @override
  String get fieldRr => 'Frec. respiratoria (rpm)';

  @override
  String get fieldTemp => 'Temperatura (°C)';

  @override
  String get fieldSpo2 => 'SpO₂ (%)';

  @override
  String get fieldDiuresis => 'Diuresis (mL/h)';

  @override
  String get fieldNotes => 'Observaciones';

  @override
  String get noVitals => 'Sin signos vitales registrados';

  @override
  String get noLabs => 'Sin resultados de laboratorio';

  @override
  String get newLab => 'Nuevo lab';

  @override
  String get labSaved => 'Resultado guardado';

  @override
  String get fieldParameter => 'Parámetro';

  @override
  String get fieldValue => 'Valor';

  @override
  String get fieldUnit => 'Unidad';

  @override
  String get dateAndTime => 'Fecha y hora';

  @override
  String get atLeastOneField => 'Ingrese al menos un valor';

  @override
  String get parameterRequired => 'Seleccione un parámetro';

  @override
  String get tabHd => 'HD';

  @override
  String get tabVent => 'Ventilación';

  @override
  String get hdNew => 'Nueva sesión HD';

  @override
  String get hdSaved => 'Sesión HD guardada';

  @override
  String get noHdSessions => 'Sin sesiones HD registradas';

  @override
  String get ventNew => 'Nueva ventilación';

  @override
  String get ventSaved => 'Registro de ventilación guardado';

  @override
  String get noVentRecords => 'Sin registros de ventilación';

  @override
  String get fieldStartTime => 'Inicio de sesión';

  @override
  String get fieldEndTime => 'Fin de sesión';

  @override
  String get fieldVascularAccess => 'Acceso vascular';

  @override
  String get fieldLaterality => 'Lateralidad';

  @override
  String get fieldCatheterType => 'Tipo de catéter';

  @override
  String get fieldPlannedDuration => 'Duración programada (min)';

  @override
  String get fieldActualDuration => 'Duración real (min)';

  @override
  String get fieldQb => 'Qb — Flujo de sangre (mL/min)';

  @override
  String get fieldQd => 'Qd — Flujo de dializato (mL/min)';

  @override
  String get fieldDialyzer => 'Tipo de dializador';

  @override
  String get fieldDialyzerSurface => 'Superficie dializador (m²)';

  @override
  String get fieldDialyzerKuf => 'KUf (mL/h/mmHg)';

  @override
  String get fieldDialysisBath => 'Baño de diálisis';

  @override
  String get fieldBathNa => 'Na (mEq/L)';

  @override
  String get fieldBathK => 'K (mEq/L)';

  @override
  String get fieldBathCa => 'Ca (mEq/L)';

  @override
  String get fieldBathHco3 => 'HCO₃ (mEq/L)';

  @override
  String get fieldBathGlucose => 'Glucosa baño (mg/dL)';

  @override
  String get fieldUfPlanned => 'UF programada (mL)';

  @override
  String get fieldUfActual => 'UF real (mL)';

  @override
  String get fieldUfRate => 'Tasa UF (mL/kg/h)';

  @override
  String get fieldAnticoagulation => 'Anticoagulación';

  @override
  String get fieldHeparinBolus => 'Heparina bolo (UI)';

  @override
  String get fieldHeparinMaint => 'Heparina mantenimiento (UI/h)';

  @override
  String get fieldPreWeight => 'Peso pre-HD (kg)';

  @override
  String get fieldPostWeight => 'Peso post-HD (kg)';

  @override
  String get fieldDryWeightTarget => 'Peso seco objetivo (kg)';

  @override
  String get fieldSessionEvents => 'Eventos durante la sesión';

  @override
  String get lateralLeft => 'Izquierdo';

  @override
  String get lateralRight => 'Derecho';

  @override
  String get cathTransient => 'Transitorio';

  @override
  String get cathTunneled => 'Tunelizado';

  @override
  String get anticoagHeparin => 'Heparina';

  @override
  String get anticoagCitrate => 'Citrato';

  @override
  String get anticoagNone => 'Ninguna';

  @override
  String get fieldVentMode => 'Modo ventilatorio';

  @override
  String get fieldFio2 => 'FiO₂ (0.21–1.0)';

  @override
  String get fieldPeep => 'PEEP (cmH₂O)';

  @override
  String get fieldVt => 'Volumen tidal progr. (mL)';

  @override
  String get fieldPControl => 'Presión control (cmH₂O)';

  @override
  String get fieldRrSet => 'FR programada (rpm)';

  @override
  String get fieldIERatio => 'Relación I:E';

  @override
  String get fieldPSupport => 'Presión soporte PSV (cmH₂O)';

  @override
  String get fieldTrigger => 'Trigger';

  @override
  String get fieldPeak => 'Presión pico (cmH₂O)';

  @override
  String get fieldPlateau => 'Presión meseta (cmH₂O)';

  @override
  String get fieldMeanAirway => 'Presión media vía aérea (cmH₂O)';

  @override
  String get fieldVtExp => 'VT espirado (mL)';

  @override
  String get fieldRrTotal => 'FR total (rpm)';

  @override
  String get fieldMinVol => 'Volumen minuto (L/min)';

  @override
  String get fieldLeak => 'Fuga (%)';

  @override
  String get fieldPao2 => 'PaO₂ gases arteriales (mmHg)';

  @override
  String get fieldPfRatio => 'P/F ratio';

  @override
  String get fieldDrivingPressure => 'Driving pressure (cmH₂O)';

  @override
  String get fieldCompliance => 'Compliance estática (mL/cmH₂O)';

  @override
  String get ardsMild => 'Leve (P/F 200–300)';

  @override
  String get ardsModerate => 'Moderado (P/F 100–200)';

  @override
  String get ardsSevere => 'Grave (P/F < 100)';

  @override
  String get ardsNone => 'Sin criterios ARDS';

  @override
  String get historiaTitle => 'Historia Clínica';

  @override
  String get historiaEdit => 'Editar Historia';

  @override
  String get historiaSaved => 'Historia clínica guardada';

  @override
  String get noHistoria => 'Sin historia clínica registrada';

  @override
  String get fieldHea => 'HEA — Historia de la Enfermedad Actual';

  @override
  String get fieldApp => 'APP — Antecedentes Patológicos Personales';

  @override
  String get fieldApf => 'APF — Antecedentes Patológicos Familiares';

  @override
  String get fieldAlergias => 'Alergias';

  @override
  String get addAlergia => 'Agregar alergia';

  @override
  String get fieldOperacionesPrevias => 'Operaciones previas';

  @override
  String get fieldDatosPositivos => 'Datos positivos del interrogatorio';

  @override
  String get fieldExamenFisico => 'Examen físico por aparatos y sistemas';

  @override
  String get auditAction_create => 'Registro';

  @override
  String get auditAction_update => 'Actualización';

  @override
  String get auditAction_invalidate => 'Invalidación';

  @override
  String get auditAction_read => 'Lectura';

  @override
  String get auditAction_export => 'Exportación';

  @override
  String get auditAction_login => 'Inicio de sesión';

  @override
  String get auditAction_logout => 'Cierre de sesión';

  @override
  String get auditAction_calc => 'Cálculo';

  @override
  String get auditAction_pdf => 'PDF generado';

  @override
  String get noAuditRecords => 'Sin registros de auditoría';

  @override
  String get lockTimeout20min => '20 minutos';

  @override
  String get lockTimeout30min => '30 minutos';
}
