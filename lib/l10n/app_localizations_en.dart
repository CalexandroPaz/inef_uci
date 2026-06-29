// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'INEF UCI';

  @override
  String get institutionName =>
      'Institute of Nephrology Dr. Abelardo Buch López';

  @override
  String get institutionSubtitle =>
      'Institute of Nephrology Dr. Abelardo Buch López';

  @override
  String get exclusiveUseNotice =>
      'For the exclusive use of the Institute of Nephrology Dr. Abelardo Buch López. Distribution outside the institution is prohibited.';

  @override
  String get clinicalDisclaimer =>
      'Clinical support tool. Does not replace professional judgment. Not a certified medical device.';

  @override
  String get loginTitle => 'INEF UCI Access';

  @override
  String get loginSubtitle => 'Enter your PIN to continue';

  @override
  String get pinLabel => 'PIN (6 digits)';

  @override
  String get pinConfirm => 'Confirm PIN';

  @override
  String get pinSetupTitle => 'Set access PIN';

  @override
  String get pinSetupSubtitle => 'Choose a 6-digit PIN to protect your data';

  @override
  String get useBiometrics => 'Use fingerprint';

  @override
  String get biometricsPrompt => 'Authenticate to access INEF UCI';

  @override
  String get incorrectPin => 'Incorrect PIN';

  @override
  String attemptsRemaining(int count) {
    return '$count attempts remaining';
  }

  @override
  String get accountLocked => 'Access temporarily locked';

  @override
  String get patientsTitle => 'Patients';

  @override
  String get searchPatients => 'Search patient...';

  @override
  String get filterService => 'Service';

  @override
  String get filterStatus => 'Status';

  @override
  String get statusActive => 'Active';

  @override
  String get statusDischarged => 'Discharged';

  @override
  String get statusDeceased => 'Deceased';

  @override
  String get noPatients => 'No patients registered';

  @override
  String get newPatient => 'New patient';

  @override
  String get patientDetailTitle => 'Clinical Record';

  @override
  String get generalData => 'General data';

  @override
  String get clinicalHistory => 'Medical history';

  @override
  String get episodes => 'Episodes';

  @override
  String get labs => 'Laboratory';

  @override
  String get vitals => 'Vital signs';

  @override
  String get images => 'Images';

  @override
  String get ekg => 'EKG';

  @override
  String get ventilation => 'Mechanical ventilation';

  @override
  String get hemodialysis => 'Hemodialysis';

  @override
  String get calculators => 'Calculators';

  @override
  String get calculatorsTitle => 'Medical calculators';

  @override
  String get ktvTitle => 'Kt/V Daugirdas II';

  @override
  String get ktvDescription => 'Hemodialysis adequacy';

  @override
  String ktvResult(String value) {
    return 'Kt/V = $value';
  }

  @override
  String get ktvAdequate => 'Adequate (≥ 1.2)';

  @override
  String get ktvInadequate => 'Inadequate (< 1.2)';

  @override
  String get fieldUreaPre => 'Pre-dialysis urea';

  @override
  String get fieldUreaPost => 'Post-dialysis urea';

  @override
  String get fieldDuration => 'Session duration (minutes)';

  @override
  String get fieldUfVolume => 'Total ultrafiltration (L)';

  @override
  String get fieldWeightPost => 'Post-dialysis weight (kg)';

  @override
  String get fieldUrr => 'URR (%)';

  @override
  String get calculate => 'Calculate';

  @override
  String get exportPdf => 'Export PDF';

  @override
  String get saveResult => 'Save result';

  @override
  String get resultSaved => 'Result saved';

  @override
  String originAutoLab(String datetime) {
    return 'Auto: Lab from $datetime';
  }

  @override
  String originAutoHd(String datetime) {
    return 'Auto: Last HD session from $datetime';
  }

  @override
  String get originManual => 'Manually edited';

  @override
  String get originMissing => 'No data';

  @override
  String warningOutOfRange(String min, String max, String unit) {
    return 'Value out of physiological range ($min–$max $unit). Confirm?';
  }

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get back => 'Back';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get languageLabel => 'Language';

  @override
  String get languageEs => 'Español';

  @override
  String get languageEn => 'English';

  @override
  String get languageFr => 'Français';

  @override
  String get lockTimeout => 'Auto-lock';

  @override
  String get lockTimeout5min => '5 minutes';

  @override
  String get lockTimeout10min => '10 minutes';

  @override
  String get lockTimeout15min => '15 minutes';

  @override
  String get aboutTitle => 'About';

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

  @override
  String get auditLogTitle => 'Audit log';

  @override
  String get pdfHeaderGenerated => 'Generated by INEF UCI';

  @override
  String pdfPage(int n, int total) {
    return 'Page $n of $total';
  }

  @override
  String get epiTitle => 'Epidemiology';

  @override
  String get epiLra3 => 'AKI KDIGO 3 by range/service';

  @override
  String get epiMortality => 'Mortality with initial SOFA ≥ threshold';

  @override
  String get epiKtvAvg => 'Average Kt/V by dialyzer';

  @override
  String get epiComingSoon => 'Epidemiological queries available in v2.0';

  @override
  String get hdAccessFav => 'Radiocephalic AV fistula';

  @override
  String get hdAccessFavBrachio => 'Brachiocephalic AV fistula';

  @override
  String get hdAccessFavBrachiobasilic => 'Brachiobasilic AV fistula';

  @override
  String get hdAccessGraft => 'Graft';

  @override
  String get hdAccessJugular => 'Jugular catheter';

  @override
  String get hdAccessFemoral => 'Femoral catheter';

  @override
  String get hdAccessSubclavian => 'Subclavian catheter';

  @override
  String get hdAccessTransient => 'Transient';

  @override
  String get hdAccessTunneled => 'Tunneled';

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
  String get fieldHc => 'Record No.';

  @override
  String get fieldFullName => 'Full name';

  @override
  String get fieldCedula => 'ID Card';

  @override
  String get fieldBirthDate => 'Date of birth';

  @override
  String get fieldSex => 'Sex';

  @override
  String get fieldBloodGroup => 'Blood group';

  @override
  String get fieldRhFactor => 'Rh Factor';

  @override
  String get fieldDryWeight => 'Dry weight (kg)';

  @override
  String get fieldCurrentWeight => 'Current weight (kg)';

  @override
  String get fieldHeight => 'Height (cm)';

  @override
  String get fieldService => 'Service';

  @override
  String get fieldAdmissionDate => 'Admission date';

  @override
  String get fieldAdmissionReason => 'Admission reason';

  @override
  String get sexMale => 'Male';

  @override
  String get sexFemale => 'Female';

  @override
  String get fieldRequired => 'Required field';

  @override
  String get patientSaved => 'Patient registered';

  @override
  String get patientUpdated => 'Patient updated';

  @override
  String get duplicateHc => 'Record number already exists';

  @override
  String get lockApp => 'Lock';

  @override
  String get selectDate => 'Select date';

  @override
  String noSearchResults(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String ageYears(int years) {
    return '$years years';
  }

  @override
  String get tabData => 'Data';

  @override
  String get newVitalSigns => 'New VS';

  @override
  String get vitalsSaved => 'Vital signs saved';

  @override
  String get fieldFc => 'Heart rate (bpm)';

  @override
  String get fieldBpSystolic => 'Systolic BP (mmHg)';

  @override
  String get fieldBpDiastolic => 'Diastolic BP (mmHg)';

  @override
  String get fieldMap => 'MAP (mmHg)';

  @override
  String get fieldRr => 'Respiratory rate (rpm)';

  @override
  String get fieldTemp => 'Temperature (°C)';

  @override
  String get fieldSpo2 => 'SpO₂ (%)';

  @override
  String get fieldDiuresis => 'Urine output (mL/h)';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get noVitals => 'No vital signs recorded';

  @override
  String get noLabs => 'No lab results recorded';

  @override
  String get newLab => 'New lab';

  @override
  String get labSaved => 'Result saved';

  @override
  String get fieldParameter => 'Parameter';

  @override
  String get fieldValue => 'Value';

  @override
  String get fieldUnit => 'Unit';

  @override
  String get dateAndTime => 'Date & time';

  @override
  String get atLeastOneField => 'Enter at least one value';

  @override
  String get parameterRequired => 'Select a parameter';

  @override
  String get tabHd => 'HD';

  @override
  String get tabVent => 'Ventilation';

  @override
  String get hdNew => 'New HD session';

  @override
  String get hdSaved => 'HD session saved';

  @override
  String get noHdSessions => 'No HD sessions recorded';

  @override
  String get ventNew => 'New ventilation';

  @override
  String get ventSaved => 'Ventilation record saved';

  @override
  String get noVentRecords => 'No ventilation records';

  @override
  String get fieldStartTime => 'Session start';

  @override
  String get fieldEndTime => 'Session end';

  @override
  String get fieldVascularAccess => 'Vascular access';

  @override
  String get fieldLaterality => 'Laterality';

  @override
  String get fieldCatheterType => 'Catheter type';

  @override
  String get fieldPlannedDuration => 'Planned duration (min)';

  @override
  String get fieldActualDuration => 'Actual duration (min)';

  @override
  String get fieldQb => 'Qb — Blood flow (mL/min)';

  @override
  String get fieldQd => 'Qd — Dialysate flow (mL/min)';

  @override
  String get fieldDialyzer => 'Dialyzer type';

  @override
  String get fieldDialyzerSurface => 'Dialyzer surface (m²)';

  @override
  String get fieldDialyzerKuf => 'KUf (mL/h/mmHg)';

  @override
  String get fieldDialysisBath => 'Dialysis bath';

  @override
  String get fieldBathNa => 'Na (mEq/L)';

  @override
  String get fieldBathK => 'K (mEq/L)';

  @override
  String get fieldBathCa => 'Ca (mEq/L)';

  @override
  String get fieldBathHco3 => 'HCO₃ (mEq/L)';

  @override
  String get fieldBathGlucose => 'Bath glucose (mg/dL)';

  @override
  String get fieldUfPlanned => 'Planned UF (mL)';

  @override
  String get fieldUfActual => 'Actual UF (mL)';

  @override
  String get fieldUfRate => 'UF rate (mL/kg/h)';

  @override
  String get fieldAnticoagulation => 'Anticoagulation';

  @override
  String get fieldHeparinBolus => 'Heparin bolus (IU)';

  @override
  String get fieldHeparinMaint => 'Heparin maintenance (IU/h)';

  @override
  String get fieldPreWeight => 'Pre-HD weight (kg)';

  @override
  String get fieldPostWeight => 'Post-HD weight (kg)';

  @override
  String get fieldDryWeightTarget => 'Target dry weight (kg)';

  @override
  String get fieldSessionEvents => 'Events during session';

  @override
  String get lateralLeft => 'Left';

  @override
  String get lateralRight => 'Right';

  @override
  String get cathTransient => 'Transient';

  @override
  String get cathTunneled => 'Tunneled';

  @override
  String get anticoagHeparin => 'Heparin';

  @override
  String get anticoagCitrate => 'Citrate';

  @override
  String get anticoagNone => 'None';

  @override
  String get fieldVentMode => 'Ventilation mode';

  @override
  String get fieldFio2 => 'FiO₂ (0.21–1.0)';

  @override
  String get fieldPeep => 'PEEP (cmH₂O)';

  @override
  String get fieldVt => 'Tidal volume set (mL)';

  @override
  String get fieldPControl => 'Control pressure (cmH₂O)';

  @override
  String get fieldRrSet => 'Set RR (rpm)';

  @override
  String get fieldIERatio => 'I:E ratio';

  @override
  String get fieldPSupport => 'PSV pressure (cmH₂O)';

  @override
  String get fieldTrigger => 'Trigger';

  @override
  String get fieldPeak => 'Peak pressure (cmH₂O)';

  @override
  String get fieldPlateau => 'Plateau pressure (cmH₂O)';

  @override
  String get fieldMeanAirway => 'Mean airway pressure (cmH₂O)';

  @override
  String get fieldVtExp => 'Expired VT (mL)';

  @override
  String get fieldRrTotal => 'Total RR (rpm)';

  @override
  String get fieldMinVol => 'Minute volume (L/min)';

  @override
  String get fieldLeak => 'Leak (%)';

  @override
  String get fieldPao2 => 'PaO₂ blood gas (mmHg)';

  @override
  String get fieldPfRatio => 'P/F ratio';

  @override
  String get fieldDrivingPressure => 'Driving pressure (cmH₂O)';

  @override
  String get fieldCompliance => 'Static compliance (mL/cmH₂O)';

  @override
  String get ardsMild => 'Mild (P/F 200–300)';

  @override
  String get ardsModerate => 'Moderate (P/F 100–200)';

  @override
  String get ardsSevere => 'Severe (P/F < 100)';

  @override
  String get ardsNone => 'No ARDS criteria';

  @override
  String get historiaTitle => 'Clinical History';

  @override
  String get historiaEdit => 'Edit History';

  @override
  String get historiaSaved => 'Clinical history saved';

  @override
  String get noHistoria => 'No clinical history recorded';

  @override
  String get fieldHea => 'HEA — History of Present Illness';

  @override
  String get fieldApp => 'PMH — Past Medical History';

  @override
  String get fieldApf => 'FH — Family History';

  @override
  String get fieldAlergias => 'Allergies';

  @override
  String get addAlergia => 'Add allergy';

  @override
  String get fieldOperacionesPrevias => 'Previous surgeries';

  @override
  String get fieldDatosPositivos => 'Positive findings on review of systems';

  @override
  String get fieldExamenFisico => 'Physical examination by system';

  @override
  String get auditAction_create => 'Record';

  @override
  String get auditAction_update => 'Update';

  @override
  String get auditAction_invalidate => 'Invalidation';

  @override
  String get auditAction_read => 'Read';

  @override
  String get auditAction_export => 'Export';

  @override
  String get auditAction_login => 'Login';

  @override
  String get auditAction_logout => 'Logout';

  @override
  String get auditAction_calc => 'Calculation';

  @override
  String get auditAction_pdf => 'PDF generated';

  @override
  String get noAuditRecords => 'No audit records';

  @override
  String get lockTimeout20min => '20 minutes';

  @override
  String get lockTimeout30min => '30 minutes';
}
