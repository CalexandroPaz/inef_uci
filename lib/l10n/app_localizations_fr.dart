// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'INEF UCI';

  @override
  String get institutionName =>
      'Institut de Néphrologie Dr. Abelardo Buch López';

  @override
  String get institutionSubtitle =>
      'Institut de Néphrologie Dr. Abelardo Buch López';

  @override
  String get exclusiveUseNotice =>
      'Usage exclusif de l\'Institut de Néphrologie Dr. Abelardo Buch López. Distribution interdite hors de l\'institution.';

  @override
  String get clinicalDisclaimer =>
      'Outil d\'aide clinique. Ne remplace pas le jugement professionnel. N\'est pas un dispositif médical certifié.';

  @override
  String get loginTitle => 'Accès INEF UCI';

  @override
  String get loginSubtitle => 'Entrez votre PIN pour continuer';

  @override
  String get pinLabel => 'PIN (6 chiffres)';

  @override
  String get pinConfirm => 'Confirmer le PIN';

  @override
  String get pinSetupTitle => 'Configurer le PIN d\'accès';

  @override
  String get pinSetupSubtitle =>
      'Choisissez un PIN à 6 chiffres pour protéger vos données';

  @override
  String get useBiometrics => 'Utiliser l\'empreinte digitale';

  @override
  String get biometricsPrompt => 'Authentifiez-vous pour accéder à INEF UCI';

  @override
  String get incorrectPin => 'PIN incorrect';

  @override
  String attemptsRemaining(int count) {
    return '$count tentatives restantes';
  }

  @override
  String get accountLocked => 'Accès temporairement bloqué';

  @override
  String get patientsTitle => 'Patients';

  @override
  String get searchPatients => 'Rechercher un patient...';

  @override
  String get filterService => 'Service';

  @override
  String get filterStatus => 'État';

  @override
  String get statusActive => 'Actif';

  @override
  String get statusDischarged => 'Sorti';

  @override
  String get statusDeceased => 'Décédé';

  @override
  String get noPatients => 'Aucun patient enregistré';

  @override
  String get newPatient => 'Nouveau patient';

  @override
  String get patientDetailTitle => 'Dossier clinique';

  @override
  String get generalData => 'Données générales';

  @override
  String get clinicalHistory => 'Antécédents';

  @override
  String get episodes => 'Épisodes';

  @override
  String get labs => 'Laboratoire';

  @override
  String get vitals => 'Signes vitaux';

  @override
  String get images => 'Images';

  @override
  String get ekg => 'EKG';

  @override
  String get ventilation => 'Ventilation mécanique';

  @override
  String get hemodialysis => 'Hémodialyse';

  @override
  String get calculators => 'Calculatrices';

  @override
  String get calculatorsTitle => 'Calculatrices médicales';

  @override
  String get ktvTitle => 'Kt/V Daugirdas II';

  @override
  String get ktvDescription => 'Adéquation de l\'hémodialyse';

  @override
  String ktvResult(String value) {
    return 'Kt/V = $value';
  }

  @override
  String get ktvAdequate => 'Adéquat (≥ 1,2)';

  @override
  String get ktvInadequate => 'Inadéquat (< 1,2)';

  @override
  String get fieldUreaPre => 'Urée pré-dialyse';

  @override
  String get fieldUreaPost => 'Urée post-dialyse';

  @override
  String get fieldDuration => 'Durée de session (minutes)';

  @override
  String get fieldUfVolume => 'Ultrafiltration totale (L)';

  @override
  String get fieldWeightPost => 'Poids post-dialyse (kg)';

  @override
  String get fieldUrr => 'URR (%)';

  @override
  String get calculate => 'Calculer';

  @override
  String get exportPdf => 'Exporter PDF';

  @override
  String get saveResult => 'Enregistrer le résultat';

  @override
  String get resultSaved => 'Résultat enregistré';

  @override
  String originAutoLab(String datetime) {
    return 'Auto : Lab du $datetime';
  }

  @override
  String originAutoHd(String datetime) {
    return 'Auto : Dernière séance HD du $datetime';
  }

  @override
  String get originManual => 'Modifié manuellement';

  @override
  String get originMissing => 'Aucune donnée';

  @override
  String warningOutOfRange(String min, String max, String unit) {
    return 'Valeur hors de la plage physiologique ($min–$max $unit). Confirmer ?';
  }

  @override
  String get confirm => 'Confirmer';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get edit => 'Modifier';

  @override
  String get delete => 'Supprimer';

  @override
  String get back => 'Retour';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Erreur';

  @override
  String get retry => 'Réessayer';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get languageLabel => 'Langue';

  @override
  String get languageEs => 'Español';

  @override
  String get languageEn => 'English';

  @override
  String get languageFr => 'Français';

  @override
  String get lockTimeout => 'Verrouillage automatique';

  @override
  String get lockTimeout5min => '5 minutes';

  @override
  String get lockTimeout10min => '10 minutes';

  @override
  String get lockTimeout15min => '15 minutes';

  @override
  String get aboutTitle => 'À propos';

  @override
  String appVersion(String version) {
    return 'Version $version';
  }

  @override
  String get auditLogTitle => 'Journal d\'audit';

  @override
  String get pdfHeaderGenerated => 'Généré par INEF UCI';

  @override
  String pdfPage(int n, int total) {
    return 'Page $n sur $total';
  }

  @override
  String get epiTitle => 'Épidémiologie';

  @override
  String get epiLra3 => 'IRA KDIGO 3 par plage/service';

  @override
  String get epiMortality => 'Mortalité avec SOFA initial ≥ seuil';

  @override
  String get epiKtvAvg => 'Kt/V moyen par dialyseur';

  @override
  String get epiComingSoon => 'Requêtes épidémiologiques disponibles en v2.0';

  @override
  String get hdAccessFav => 'FAV radiocéphalique';

  @override
  String get hdAccessFavBrachio => 'FAV brachiocéphalique';

  @override
  String get hdAccessFavBrachiobasilic => 'FAV brachiobasílique';

  @override
  String get hdAccessGraft => 'Greffon';

  @override
  String get hdAccessJugular => 'Cathéter jugulaire';

  @override
  String get hdAccessFemoral => 'Cathéter fémoral';

  @override
  String get hdAccessSubclavian => 'Cathéter sous-clavier';

  @override
  String get hdAccessTransient => 'Transitoire';

  @override
  String get hdAccessTunneled => 'Tunnellisé';

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
  String get fieldHc => 'No. Dossier';

  @override
  String get fieldFullName => 'Nom complet';

  @override
  String get fieldCedula => 'Carte d\'identité';

  @override
  String get fieldBirthDate => 'Date de naissance';

  @override
  String get fieldSex => 'Sexe';

  @override
  String get fieldBloodGroup => 'Groupe sanguin';

  @override
  String get fieldRhFactor => 'Facteur Rh';

  @override
  String get fieldDryWeight => 'Poids sec (kg)';

  @override
  String get fieldCurrentWeight => 'Poids actuel (kg)';

  @override
  String get fieldHeight => 'Taille (cm)';

  @override
  String get fieldService => 'Service';

  @override
  String get fieldAdmissionDate => 'Date d\'admission';

  @override
  String get fieldAdmissionReason => 'Motif d\'admission';

  @override
  String get sexMale => 'Masculin';

  @override
  String get sexFemale => 'Féminin';

  @override
  String get fieldRequired => 'Champ obligatoire';

  @override
  String get patientSaved => 'Patient enregistré';

  @override
  String get patientUpdated => 'Patient mis à jour';

  @override
  String get duplicateHc => 'Numéro de dossier déjà existant';

  @override
  String get lockApp => 'Verrouiller';

  @override
  String get selectDate => 'Sélectionner une date';

  @override
  String noSearchResults(String query) {
    return 'Aucun résultat pour \"$query\"';
  }

  @override
  String ageYears(int years) {
    return '$years ans';
  }

  @override
  String get tabData => 'Données';

  @override
  String get newVitalSigns => 'Nouveau SV';

  @override
  String get vitalsSaved => 'Signes vitaux enregistrés';

  @override
  String get fieldFc => 'Fréq. cardiaque (bpm)';

  @override
  String get fieldBpSystolic => 'PA systolique (mmHg)';

  @override
  String get fieldBpDiastolic => 'PA diastolique (mmHg)';

  @override
  String get fieldMap => 'PAM (mmHg)';

  @override
  String get fieldRr => 'Fréq. respiratoire (rpm)';

  @override
  String get fieldTemp => 'Température (°C)';

  @override
  String get fieldSpo2 => 'SpO₂ (%)';

  @override
  String get fieldDiuresis => 'Diurèse (mL/h)';

  @override
  String get fieldNotes => 'Observations';

  @override
  String get noVitals => 'Aucun signe vital enregistré';

  @override
  String get noLabs => 'Aucun résultat de laboratoire';

  @override
  String get newLab => 'Nouveau labo';

  @override
  String get labSaved => 'Résultat enregistré';

  @override
  String get fieldParameter => 'Paramètre';

  @override
  String get fieldValue => 'Valeur';

  @override
  String get fieldUnit => 'Unité';

  @override
  String get dateAndTime => 'Date et heure';

  @override
  String get atLeastOneField => 'Saisir au moins une valeur';

  @override
  String get parameterRequired => 'Sélectionner un paramètre';

  @override
  String get tabHd => 'HD';

  @override
  String get tabVent => 'Ventilation';

  @override
  String get hdNew => 'Nouvelle séance HD';

  @override
  String get hdSaved => 'Séance HD enregistrée';

  @override
  String get noHdSessions => 'Aucune séance HD';

  @override
  String get ventNew => 'Nouvelle ventilation';

  @override
  String get ventSaved => 'Enregistrement sauvegardé';

  @override
  String get noVentRecords => 'Aucun enregistrement';

  @override
  String get fieldStartTime => 'Début de séance';

  @override
  String get fieldEndTime => 'Fin de séance';

  @override
  String get fieldVascularAccess => 'Accès vasculaire';

  @override
  String get fieldLaterality => 'Latéralité';

  @override
  String get fieldCatheterType => 'Type de cathéter';

  @override
  String get fieldPlannedDuration => 'Durée prévue (min)';

  @override
  String get fieldActualDuration => 'Durée réelle (min)';

  @override
  String get fieldQb => 'Qb — Débit sanguin (mL/min)';

  @override
  String get fieldQd => 'Qd — Débit dialysat (mL/min)';

  @override
  String get fieldDialyzer => 'Type de dialyseur';

  @override
  String get fieldDialyzerSurface => 'Surface dialyseur (m²)';

  @override
  String get fieldDialyzerKuf => 'KUf (mL/h/mmHg)';

  @override
  String get fieldDialysisBath => 'Bain de dialyse';

  @override
  String get fieldBathNa => 'Na (mEq/L)';

  @override
  String get fieldBathK => 'K (mEq/L)';

  @override
  String get fieldBathCa => 'Ca (mEq/L)';

  @override
  String get fieldBathHco3 => 'HCO₃ (mEq/L)';

  @override
  String get fieldBathGlucose => 'Glucose bain (mg/dL)';

  @override
  String get fieldUfPlanned => 'UF prévue (mL)';

  @override
  String get fieldUfActual => 'UF réelle (mL)';

  @override
  String get fieldUfRate => 'Taux UF (mL/kg/h)';

  @override
  String get fieldAnticoagulation => 'Anticoagulation';

  @override
  String get fieldHeparinBolus => 'Héparine bolus (UI)';

  @override
  String get fieldHeparinMaint => 'Héparine entretien (UI/h)';

  @override
  String get fieldPreWeight => 'Poids pré-HD (kg)';

  @override
  String get fieldPostWeight => 'Poids post-HD (kg)';

  @override
  String get fieldDryWeightTarget => 'Poids sec cible (kg)';

  @override
  String get fieldSessionEvents => 'Événements pendant la séance';

  @override
  String get lateralLeft => 'Gauche';

  @override
  String get lateralRight => 'Droit';

  @override
  String get cathTransient => 'Transitoire';

  @override
  String get cathTunneled => 'Tunnellisé';

  @override
  String get anticoagHeparin => 'Héparine';

  @override
  String get anticoagCitrate => 'Citrate';

  @override
  String get anticoagNone => 'Aucune';

  @override
  String get fieldVentMode => 'Mode ventilatoire';

  @override
  String get fieldFio2 => 'FiO₂ (0.21–1.0)';

  @override
  String get fieldPeep => 'PEEP (cmH₂O)';

  @override
  String get fieldVt => 'Volume courant réglé (mL)';

  @override
  String get fieldPControl => 'Pression contrôle (cmH₂O)';

  @override
  String get fieldRrSet => 'FR réglée (rpm)';

  @override
  String get fieldIERatio => 'Rapport I:E';

  @override
  String get fieldPSupport => 'Pression aide PSV (cmH₂O)';

  @override
  String get fieldTrigger => 'Trigger';

  @override
  String get fieldPeak => 'Pression de crête (cmH₂O)';

  @override
  String get fieldPlateau => 'Pression plateau (cmH₂O)';

  @override
  String get fieldMeanAirway => 'Pression moyenne des voies (cmH₂O)';

  @override
  String get fieldVtExp => 'VT expiré (mL)';

  @override
  String get fieldRrTotal => 'FR totale (rpm)';

  @override
  String get fieldMinVol => 'Volume minute (L/min)';

  @override
  String get fieldLeak => 'Fuite (%)';

  @override
  String get fieldPao2 => 'PaO₂ gaz du sang (mmHg)';

  @override
  String get fieldPfRatio => 'Rapport P/F';

  @override
  String get fieldDrivingPressure => 'Pression motrice (cmH₂O)';

  @override
  String get fieldCompliance => 'Compliance statique (mL/cmH₂O)';

  @override
  String get ardsMild => 'Léger (P/F 200–300)';

  @override
  String get ardsModerate => 'Modéré (P/F 100–200)';

  @override
  String get ardsSevere => 'Sévère (P/F < 100)';

  @override
  String get ardsNone => 'Sans critères SDRA';

  @override
  String get historiaTitle => 'Dossier clinique';

  @override
  String get historiaEdit => 'Modifier le dossier';

  @override
  String get historiaSaved => 'Dossier clinique enregistré';

  @override
  String get noHistoria => 'Aucun dossier clinique enregistré';

  @override
  String get fieldHea => 'MHA — Motif et histoire de la maladie';

  @override
  String get fieldApp => 'ATCD — Antécédents médicaux personnels';

  @override
  String get fieldApf => 'ATCDf — Antécédents familiaux';

  @override
  String get fieldAlergias => 'Allergies';

  @override
  String get addAlergia => 'Ajouter une allergie';

  @override
  String get fieldOperacionesPrevias => 'Antécédents chirurgicaux';

  @override
  String get fieldDatosPositivos => 'Données positives de l\'interrogatoire';

  @override
  String get fieldExamenFisico => 'Examen physique par appareils et systèmes';

  @override
  String get auditAction_create => 'Création';

  @override
  String get auditAction_update => 'Mise à jour';

  @override
  String get auditAction_invalidate => 'Invalidation';

  @override
  String get auditAction_read => 'Lecture';

  @override
  String get auditAction_export => 'Exportation';

  @override
  String get auditAction_login => 'Connexion';

  @override
  String get auditAction_logout => 'Déconnexion';

  @override
  String get auditAction_calc => 'Calcul';

  @override
  String get auditAction_pdf => 'PDF généré';

  @override
  String get noAuditRecords => 'Aucun enregistrement d\'audit';

  @override
  String get lockTimeout20min => '20 minutes';

  @override
  String get lockTimeout30min => '30 minutes';
}
