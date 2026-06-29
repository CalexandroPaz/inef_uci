import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('en'),
    Locale('fr'),
  ];

  /// Nombre de la aplicación (no traducir)
  ///
  /// In es, this message translates to:
  /// **'INEF UCI'**
  String get appName;

  /// Nombre de la institución en español
  ///
  /// In es, this message translates to:
  /// **'Instituto de Nefrología Dr. Abelardo Buch López'**
  String get institutionName;

  /// Subtítulo en splash y PDFs
  ///
  /// In es, this message translates to:
  /// **'Instituto de Nefrología Dr. Abelardo Buch López'**
  String get institutionSubtitle;

  /// Aviso de uso exclusivo institucional
  ///
  /// In es, this message translates to:
  /// **'Uso exclusivo del Instituto de Nefrología Dr. Abelardo Buch López. Prohibida su distribución fuera de la institución.'**
  String get exclusiveUseNotice;

  /// Disclaimer clínico obligatorio
  ///
  /// In es, this message translates to:
  /// **'Herramienta de apoyo clínico. No sustituye el juicio profesional. No es un dispositivo médico certificado.'**
  String get clinicalDisclaimer;

  /// No description provided for @loginTitle.
  ///
  /// In es, this message translates to:
  /// **'Acceso INEF UCI'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su PIN para continuar'**
  String get loginSubtitle;

  /// No description provided for @pinLabel.
  ///
  /// In es, this message translates to:
  /// **'PIN (6 dígitos)'**
  String get pinLabel;

  /// No description provided for @pinConfirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar PIN'**
  String get pinConfirm;

  /// No description provided for @pinSetupTitle.
  ///
  /// In es, this message translates to:
  /// **'Configurar PIN de acceso'**
  String get pinSetupTitle;

  /// No description provided for @pinSetupSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Elija un PIN de 6 dígitos para proteger sus datos'**
  String get pinSetupSubtitle;

  /// No description provided for @useBiometrics.
  ///
  /// In es, this message translates to:
  /// **'Usar huella digital'**
  String get useBiometrics;

  /// No description provided for @biometricsPrompt.
  ///
  /// In es, this message translates to:
  /// **'Autentíquese para acceder a INEF UCI'**
  String get biometricsPrompt;

  /// No description provided for @incorrectPin.
  ///
  /// In es, this message translates to:
  /// **'PIN incorrecto'**
  String get incorrectPin;

  /// No description provided for @attemptsRemaining.
  ///
  /// In es, this message translates to:
  /// **'{count} intentos restantes'**
  String attemptsRemaining(int count);

  /// No description provided for @accountLocked.
  ///
  /// In es, this message translates to:
  /// **'Acceso bloqueado temporalmente'**
  String get accountLocked;

  /// No description provided for @patientsTitle.
  ///
  /// In es, this message translates to:
  /// **'Pacientes'**
  String get patientsTitle;

  /// No description provided for @searchPatients.
  ///
  /// In es, this message translates to:
  /// **'Buscar paciente...'**
  String get searchPatients;

  /// No description provided for @filterService.
  ///
  /// In es, this message translates to:
  /// **'Servicio'**
  String get filterService;

  /// No description provided for @filterStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get filterStatus;

  /// No description provided for @statusActive.
  ///
  /// In es, this message translates to:
  /// **'Activo'**
  String get statusActive;

  /// No description provided for @statusDischarged.
  ///
  /// In es, this message translates to:
  /// **'Egresado'**
  String get statusDischarged;

  /// No description provided for @statusDeceased.
  ///
  /// In es, this message translates to:
  /// **'Fallecido'**
  String get statusDeceased;

  /// No description provided for @noPatients.
  ///
  /// In es, this message translates to:
  /// **'No hay pacientes registrados'**
  String get noPatients;

  /// No description provided for @newPatient.
  ///
  /// In es, this message translates to:
  /// **'Nuevo paciente'**
  String get newPatient;

  /// No description provided for @patientDetailTitle.
  ///
  /// In es, this message translates to:
  /// **'Historia Clínica'**
  String get patientDetailTitle;

  /// No description provided for @generalData.
  ///
  /// In es, this message translates to:
  /// **'Datos generales'**
  String get generalData;

  /// No description provided for @clinicalHistory.
  ///
  /// In es, this message translates to:
  /// **'Antecedentes'**
  String get clinicalHistory;

  /// No description provided for @episodes.
  ///
  /// In es, this message translates to:
  /// **'Episodios'**
  String get episodes;

  /// No description provided for @labs.
  ///
  /// In es, this message translates to:
  /// **'Laboratorio'**
  String get labs;

  /// No description provided for @vitals.
  ///
  /// In es, this message translates to:
  /// **'Signos vitales'**
  String get vitals;

  /// No description provided for @images.
  ///
  /// In es, this message translates to:
  /// **'Imágenes'**
  String get images;

  /// No description provided for @ekg.
  ///
  /// In es, this message translates to:
  /// **'EKG'**
  String get ekg;

  /// No description provided for @ventilation.
  ///
  /// In es, this message translates to:
  /// **'Ventilación mecánica'**
  String get ventilation;

  /// No description provided for @hemodialysis.
  ///
  /// In es, this message translates to:
  /// **'Hemodiálisis'**
  String get hemodialysis;

  /// No description provided for @calculators.
  ///
  /// In es, this message translates to:
  /// **'Calculadoras'**
  String get calculators;

  /// No description provided for @calculatorsTitle.
  ///
  /// In es, this message translates to:
  /// **'Calculadoras médicas'**
  String get calculatorsTitle;

  /// No description provided for @ktvTitle.
  ///
  /// In es, this message translates to:
  /// **'Kt/V Daugirdas II'**
  String get ktvTitle;

  /// No description provided for @ktvDescription.
  ///
  /// In es, this message translates to:
  /// **'Eficacia de hemodiálisis'**
  String get ktvDescription;

  /// No description provided for @ktvResult.
  ///
  /// In es, this message translates to:
  /// **'Kt/V = {value}'**
  String ktvResult(String value);

  /// No description provided for @ktvAdequate.
  ///
  /// In es, this message translates to:
  /// **'Adecuado (≥ 1.2)'**
  String get ktvAdequate;

  /// No description provided for @ktvInadequate.
  ///
  /// In es, this message translates to:
  /// **'Inadecuado (< 1.2)'**
  String get ktvInadequate;

  /// No description provided for @fieldUreaPre.
  ///
  /// In es, this message translates to:
  /// **'Urea pre-diálisis'**
  String get fieldUreaPre;

  /// No description provided for @fieldUreaPost.
  ///
  /// In es, this message translates to:
  /// **'Urea post-diálisis'**
  String get fieldUreaPost;

  /// No description provided for @fieldDuration.
  ///
  /// In es, this message translates to:
  /// **'Duración de sesión (minutos)'**
  String get fieldDuration;

  /// No description provided for @fieldUfVolume.
  ///
  /// In es, this message translates to:
  /// **'Ultrafiltración total (L)'**
  String get fieldUfVolume;

  /// No description provided for @fieldWeightPost.
  ///
  /// In es, this message translates to:
  /// **'Peso post-diálisis (kg)'**
  String get fieldWeightPost;

  /// No description provided for @fieldUrr.
  ///
  /// In es, this message translates to:
  /// **'URR (%)'**
  String get fieldUrr;

  /// No description provided for @calculate.
  ///
  /// In es, this message translates to:
  /// **'Calcular'**
  String get calculate;

  /// No description provided for @exportPdf.
  ///
  /// In es, this message translates to:
  /// **'Exportar PDF'**
  String get exportPdf;

  /// No description provided for @saveResult.
  ///
  /// In es, this message translates to:
  /// **'Guardar resultado'**
  String get saveResult;

  /// No description provided for @resultSaved.
  ///
  /// In es, this message translates to:
  /// **'Resultado guardado'**
  String get resultSaved;

  /// No description provided for @originAutoLab.
  ///
  /// In es, this message translates to:
  /// **'Auto: Lab del {datetime}'**
  String originAutoLab(String datetime);

  /// No description provided for @originAutoHd.
  ///
  /// In es, this message translates to:
  /// **'Auto: Última sesión HD del {datetime}'**
  String originAutoHd(String datetime);

  /// No description provided for @originManual.
  ///
  /// In es, this message translates to:
  /// **'Editado manualmente'**
  String get originManual;

  /// No description provided for @originMissing.
  ///
  /// In es, this message translates to:
  /// **'Sin dato'**
  String get originMissing;

  /// No description provided for @warningOutOfRange.
  ///
  /// In es, this message translates to:
  /// **'Valor fuera del rango fisiológico ({min}–{max} {unit}). ¿Confirmar?'**
  String warningOutOfRange(String min, String max, String unit);

  /// No description provided for @confirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get delete;

  /// No description provided for @back.
  ///
  /// In es, this message translates to:
  /// **'Atrás'**
  String get back;

  /// No description provided for @loading.
  ///
  /// In es, this message translates to:
  /// **'Cargando...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settingsTitle;

  /// No description provided for @languageLabel.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get languageLabel;

  /// No description provided for @languageEs.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get languageEs;

  /// No description provided for @languageEn.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get languageEn;

  /// No description provided for @languageFr.
  ///
  /// In es, this message translates to:
  /// **'Français'**
  String get languageFr;

  /// No description provided for @lockTimeout.
  ///
  /// In es, this message translates to:
  /// **'Bloqueo automático'**
  String get lockTimeout;

  /// No description provided for @lockTimeout5min.
  ///
  /// In es, this message translates to:
  /// **'5 minutos'**
  String get lockTimeout5min;

  /// No description provided for @lockTimeout10min.
  ///
  /// In es, this message translates to:
  /// **'10 minutos'**
  String get lockTimeout10min;

  /// No description provided for @lockTimeout15min.
  ///
  /// In es, this message translates to:
  /// **'15 minutos'**
  String get lockTimeout15min;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get aboutTitle;

  /// No description provided for @appVersion.
  ///
  /// In es, this message translates to:
  /// **'Versión {version}'**
  String appVersion(String version);

  /// No description provided for @auditLogTitle.
  ///
  /// In es, this message translates to:
  /// **'Registro de auditoría'**
  String get auditLogTitle;

  /// No description provided for @pdfHeaderGenerated.
  ///
  /// In es, this message translates to:
  /// **'Generado por INEF UCI'**
  String get pdfHeaderGenerated;

  /// No description provided for @pdfPage.
  ///
  /// In es, this message translates to:
  /// **'Página {n} de {total}'**
  String pdfPage(int n, int total);

  /// No description provided for @epiTitle.
  ///
  /// In es, this message translates to:
  /// **'Epidemiología'**
  String get epiTitle;

  /// No description provided for @epiLra3.
  ///
  /// In es, this message translates to:
  /// **'LRA KDIGO 3 por rango/servicio'**
  String get epiLra3;

  /// No description provided for @epiMortality.
  ///
  /// In es, this message translates to:
  /// **'Mortalidad con SOFA inicial ≥ umbral'**
  String get epiMortality;

  /// No description provided for @epiKtvAvg.
  ///
  /// In es, this message translates to:
  /// **'Kt/V promedio por dializador'**
  String get epiKtvAvg;

  /// No description provided for @epiComingSoon.
  ///
  /// In es, this message translates to:
  /// **'Consultas epidemiológicas disponibles en v2.0'**
  String get epiComingSoon;

  /// No description provided for @hdAccessFav.
  ///
  /// In es, this message translates to:
  /// **'FAV radiocefálica'**
  String get hdAccessFav;

  /// No description provided for @hdAccessFavBrachio.
  ///
  /// In es, this message translates to:
  /// **'FAV braquiocefálica'**
  String get hdAccessFavBrachio;

  /// No description provided for @hdAccessFavBrachiobasilic.
  ///
  /// In es, this message translates to:
  /// **'FAV braquiobasílica'**
  String get hdAccessFavBrachiobasilic;

  /// No description provided for @hdAccessGraft.
  ///
  /// In es, this message translates to:
  /// **'Injerto'**
  String get hdAccessGraft;

  /// No description provided for @hdAccessJugular.
  ///
  /// In es, this message translates to:
  /// **'Catéter yugular'**
  String get hdAccessJugular;

  /// No description provided for @hdAccessFemoral.
  ///
  /// In es, this message translates to:
  /// **'Catéter femoral'**
  String get hdAccessFemoral;

  /// No description provided for @hdAccessSubclavian.
  ///
  /// In es, this message translates to:
  /// **'Catéter subclavio'**
  String get hdAccessSubclavian;

  /// No description provided for @hdAccessTransient.
  ///
  /// In es, this message translates to:
  /// **'Transitorio'**
  String get hdAccessTransient;

  /// No description provided for @hdAccessTunneled.
  ///
  /// In es, this message translates to:
  /// **'Tunelizado'**
  String get hdAccessTunneled;

  /// No description provided for @ventModeVcCmv.
  ///
  /// In es, this message translates to:
  /// **'VC-CMV'**
  String get ventModeVcCmv;

  /// No description provided for @ventModeVcAc.
  ///
  /// In es, this message translates to:
  /// **'VC-AC'**
  String get ventModeVcAc;

  /// No description provided for @ventModePcAc.
  ///
  /// In es, this message translates to:
  /// **'PC-AC'**
  String get ventModePcAc;

  /// No description provided for @ventModePcCmv.
  ///
  /// In es, this message translates to:
  /// **'PC-CMV'**
  String get ventModePcCmv;

  /// No description provided for @ventModeSimv.
  ///
  /// In es, this message translates to:
  /// **'SIMV'**
  String get ventModeSimv;

  /// No description provided for @ventModePsv.
  ///
  /// In es, this message translates to:
  /// **'PSV'**
  String get ventModePsv;

  /// No description provided for @ventModeCpap.
  ///
  /// In es, this message translates to:
  /// **'CPAP'**
  String get ventModeCpap;

  /// No description provided for @ventModeAutoflow.
  ///
  /// In es, this message translates to:
  /// **'AutoFlow'**
  String get ventModeAutoflow;

  /// No description provided for @ventModeAprv.
  ///
  /// In es, this message translates to:
  /// **'PC-APRV'**
  String get ventModeAprv;

  /// No description provided for @fieldHc.
  ///
  /// In es, this message translates to:
  /// **'No. Historia Clínica'**
  String get fieldHc;

  /// No description provided for @fieldFullName.
  ///
  /// In es, this message translates to:
  /// **'Nombre completo'**
  String get fieldFullName;

  /// No description provided for @fieldCedula.
  ///
  /// In es, this message translates to:
  /// **'Cédula de identidad'**
  String get fieldCedula;

  /// No description provided for @fieldBirthDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha de nacimiento'**
  String get fieldBirthDate;

  /// No description provided for @fieldSex.
  ///
  /// In es, this message translates to:
  /// **'Sexo'**
  String get fieldSex;

  /// No description provided for @fieldBloodGroup.
  ///
  /// In es, this message translates to:
  /// **'Grupo sanguíneo'**
  String get fieldBloodGroup;

  /// No description provided for @fieldRhFactor.
  ///
  /// In es, this message translates to:
  /// **'Factor Rh'**
  String get fieldRhFactor;

  /// No description provided for @fieldDryWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso seco (kg)'**
  String get fieldDryWeight;

  /// No description provided for @fieldCurrentWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso actual (kg)'**
  String get fieldCurrentWeight;

  /// No description provided for @fieldHeight.
  ///
  /// In es, this message translates to:
  /// **'Talla (cm)'**
  String get fieldHeight;

  /// No description provided for @fieldService.
  ///
  /// In es, this message translates to:
  /// **'Servicio'**
  String get fieldService;

  /// No description provided for @fieldAdmissionDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha de ingreso'**
  String get fieldAdmissionDate;

  /// No description provided for @fieldAdmissionReason.
  ///
  /// In es, this message translates to:
  /// **'Motivo de ingreso'**
  String get fieldAdmissionReason;

  /// No description provided for @sexMale.
  ///
  /// In es, this message translates to:
  /// **'Masculino'**
  String get sexMale;

  /// No description provided for @sexFemale.
  ///
  /// In es, this message translates to:
  /// **'Femenino'**
  String get sexFemale;

  /// No description provided for @fieldRequired.
  ///
  /// In es, this message translates to:
  /// **'Campo obligatorio'**
  String get fieldRequired;

  /// No description provided for @patientSaved.
  ///
  /// In es, this message translates to:
  /// **'Paciente registrado'**
  String get patientSaved;

  /// No description provided for @patientUpdated.
  ///
  /// In es, this message translates to:
  /// **'Paciente actualizado'**
  String get patientUpdated;

  /// No description provided for @duplicateHc.
  ///
  /// In es, this message translates to:
  /// **'Número de HC ya existe'**
  String get duplicateHc;

  /// No description provided for @lockApp.
  ///
  /// In es, this message translates to:
  /// **'Bloquear'**
  String get lockApp;

  /// No description provided for @selectDate.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar fecha'**
  String get selectDate;

  /// No description provided for @noSearchResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados para \"{query}\"'**
  String noSearchResults(String query);

  /// No description provided for @ageYears.
  ///
  /// In es, this message translates to:
  /// **'{years} años'**
  String ageYears(int years);

  /// No description provided for @tabData.
  ///
  /// In es, this message translates to:
  /// **'Datos'**
  String get tabData;

  /// No description provided for @newVitalSigns.
  ///
  /// In es, this message translates to:
  /// **'Nuevo SV'**
  String get newVitalSigns;

  /// No description provided for @vitalsSaved.
  ///
  /// In es, this message translates to:
  /// **'Signos vitales guardados'**
  String get vitalsSaved;

  /// No description provided for @fieldFc.
  ///
  /// In es, this message translates to:
  /// **'Frec. cardíaca (lpm)'**
  String get fieldFc;

  /// No description provided for @fieldBpSystolic.
  ///
  /// In es, this message translates to:
  /// **'PA sistólica (mmHg)'**
  String get fieldBpSystolic;

  /// No description provided for @fieldBpDiastolic.
  ///
  /// In es, this message translates to:
  /// **'PA diastólica (mmHg)'**
  String get fieldBpDiastolic;

  /// No description provided for @fieldMap.
  ///
  /// In es, this message translates to:
  /// **'PAM (mmHg)'**
  String get fieldMap;

  /// No description provided for @fieldRr.
  ///
  /// In es, this message translates to:
  /// **'Frec. respiratoria (rpm)'**
  String get fieldRr;

  /// No description provided for @fieldTemp.
  ///
  /// In es, this message translates to:
  /// **'Temperatura (°C)'**
  String get fieldTemp;

  /// No description provided for @fieldSpo2.
  ///
  /// In es, this message translates to:
  /// **'SpO₂ (%)'**
  String get fieldSpo2;

  /// No description provided for @fieldDiuresis.
  ///
  /// In es, this message translates to:
  /// **'Diuresis (mL/h)'**
  String get fieldDiuresis;

  /// No description provided for @fieldNotes.
  ///
  /// In es, this message translates to:
  /// **'Observaciones'**
  String get fieldNotes;

  /// No description provided for @noVitals.
  ///
  /// In es, this message translates to:
  /// **'Sin signos vitales registrados'**
  String get noVitals;

  /// No description provided for @noLabs.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados de laboratorio'**
  String get noLabs;

  /// No description provided for @newLab.
  ///
  /// In es, this message translates to:
  /// **'Nuevo lab'**
  String get newLab;

  /// No description provided for @labSaved.
  ///
  /// In es, this message translates to:
  /// **'Resultado guardado'**
  String get labSaved;

  /// No description provided for @fieldParameter.
  ///
  /// In es, this message translates to:
  /// **'Parámetro'**
  String get fieldParameter;

  /// No description provided for @fieldValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get fieldValue;

  /// No description provided for @fieldUnit.
  ///
  /// In es, this message translates to:
  /// **'Unidad'**
  String get fieldUnit;

  /// No description provided for @dateAndTime.
  ///
  /// In es, this message translates to:
  /// **'Fecha y hora'**
  String get dateAndTime;

  /// No description provided for @atLeastOneField.
  ///
  /// In es, this message translates to:
  /// **'Ingrese al menos un valor'**
  String get atLeastOneField;

  /// No description provided for @parameterRequired.
  ///
  /// In es, this message translates to:
  /// **'Seleccione un parámetro'**
  String get parameterRequired;

  /// No description provided for @tabHd.
  ///
  /// In es, this message translates to:
  /// **'HD'**
  String get tabHd;

  /// No description provided for @tabVent.
  ///
  /// In es, this message translates to:
  /// **'Ventilación'**
  String get tabVent;

  /// No description provided for @hdNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva sesión HD'**
  String get hdNew;

  /// No description provided for @hdSaved.
  ///
  /// In es, this message translates to:
  /// **'Sesión HD guardada'**
  String get hdSaved;

  /// No description provided for @noHdSessions.
  ///
  /// In es, this message translates to:
  /// **'Sin sesiones HD registradas'**
  String get noHdSessions;

  /// No description provided for @ventNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva ventilación'**
  String get ventNew;

  /// No description provided for @ventSaved.
  ///
  /// In es, this message translates to:
  /// **'Registro de ventilación guardado'**
  String get ventSaved;

  /// No description provided for @noVentRecords.
  ///
  /// In es, this message translates to:
  /// **'Sin registros de ventilación'**
  String get noVentRecords;

  /// No description provided for @fieldStartTime.
  ///
  /// In es, this message translates to:
  /// **'Inicio de sesión'**
  String get fieldStartTime;

  /// No description provided for @fieldEndTime.
  ///
  /// In es, this message translates to:
  /// **'Fin de sesión'**
  String get fieldEndTime;

  /// No description provided for @fieldVascularAccess.
  ///
  /// In es, this message translates to:
  /// **'Acceso vascular'**
  String get fieldVascularAccess;

  /// No description provided for @fieldLaterality.
  ///
  /// In es, this message translates to:
  /// **'Lateralidad'**
  String get fieldLaterality;

  /// No description provided for @fieldCatheterType.
  ///
  /// In es, this message translates to:
  /// **'Tipo de catéter'**
  String get fieldCatheterType;

  /// No description provided for @fieldPlannedDuration.
  ///
  /// In es, this message translates to:
  /// **'Duración programada (min)'**
  String get fieldPlannedDuration;

  /// No description provided for @fieldActualDuration.
  ///
  /// In es, this message translates to:
  /// **'Duración real (min)'**
  String get fieldActualDuration;

  /// No description provided for @fieldQb.
  ///
  /// In es, this message translates to:
  /// **'Qb — Flujo de sangre (mL/min)'**
  String get fieldQb;

  /// No description provided for @fieldQd.
  ///
  /// In es, this message translates to:
  /// **'Qd — Flujo de dializato (mL/min)'**
  String get fieldQd;

  /// No description provided for @fieldDialyzer.
  ///
  /// In es, this message translates to:
  /// **'Tipo de dializador'**
  String get fieldDialyzer;

  /// No description provided for @fieldDialyzerSurface.
  ///
  /// In es, this message translates to:
  /// **'Superficie dializador (m²)'**
  String get fieldDialyzerSurface;

  /// No description provided for @fieldDialyzerKuf.
  ///
  /// In es, this message translates to:
  /// **'KUf (mL/h/mmHg)'**
  String get fieldDialyzerKuf;

  /// No description provided for @fieldDialysisBath.
  ///
  /// In es, this message translates to:
  /// **'Baño de diálisis'**
  String get fieldDialysisBath;

  /// No description provided for @fieldBathNa.
  ///
  /// In es, this message translates to:
  /// **'Na (mEq/L)'**
  String get fieldBathNa;

  /// No description provided for @fieldBathK.
  ///
  /// In es, this message translates to:
  /// **'K (mEq/L)'**
  String get fieldBathK;

  /// No description provided for @fieldBathCa.
  ///
  /// In es, this message translates to:
  /// **'Ca (mEq/L)'**
  String get fieldBathCa;

  /// No description provided for @fieldBathHco3.
  ///
  /// In es, this message translates to:
  /// **'HCO₃ (mEq/L)'**
  String get fieldBathHco3;

  /// No description provided for @fieldBathGlucose.
  ///
  /// In es, this message translates to:
  /// **'Glucosa baño (mg/dL)'**
  String get fieldBathGlucose;

  /// No description provided for @fieldUfPlanned.
  ///
  /// In es, this message translates to:
  /// **'UF programada (mL)'**
  String get fieldUfPlanned;

  /// No description provided for @fieldUfActual.
  ///
  /// In es, this message translates to:
  /// **'UF real (mL)'**
  String get fieldUfActual;

  /// No description provided for @fieldUfRate.
  ///
  /// In es, this message translates to:
  /// **'Tasa UF (mL/kg/h)'**
  String get fieldUfRate;

  /// No description provided for @fieldAnticoagulation.
  ///
  /// In es, this message translates to:
  /// **'Anticoagulación'**
  String get fieldAnticoagulation;

  /// No description provided for @fieldHeparinBolus.
  ///
  /// In es, this message translates to:
  /// **'Heparina bolo (UI)'**
  String get fieldHeparinBolus;

  /// No description provided for @fieldHeparinMaint.
  ///
  /// In es, this message translates to:
  /// **'Heparina mantenimiento (UI/h)'**
  String get fieldHeparinMaint;

  /// No description provided for @fieldPreWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso pre-HD (kg)'**
  String get fieldPreWeight;

  /// No description provided for @fieldPostWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso post-HD (kg)'**
  String get fieldPostWeight;

  /// No description provided for @fieldDryWeightTarget.
  ///
  /// In es, this message translates to:
  /// **'Peso seco objetivo (kg)'**
  String get fieldDryWeightTarget;

  /// No description provided for @fieldSessionEvents.
  ///
  /// In es, this message translates to:
  /// **'Eventos durante la sesión'**
  String get fieldSessionEvents;

  /// No description provided for @lateralLeft.
  ///
  /// In es, this message translates to:
  /// **'Izquierdo'**
  String get lateralLeft;

  /// No description provided for @lateralRight.
  ///
  /// In es, this message translates to:
  /// **'Derecho'**
  String get lateralRight;

  /// No description provided for @cathTransient.
  ///
  /// In es, this message translates to:
  /// **'Transitorio'**
  String get cathTransient;

  /// No description provided for @cathTunneled.
  ///
  /// In es, this message translates to:
  /// **'Tunelizado'**
  String get cathTunneled;

  /// No description provided for @anticoagHeparin.
  ///
  /// In es, this message translates to:
  /// **'Heparina'**
  String get anticoagHeparin;

  /// No description provided for @anticoagCitrate.
  ///
  /// In es, this message translates to:
  /// **'Citrato'**
  String get anticoagCitrate;

  /// No description provided for @anticoagNone.
  ///
  /// In es, this message translates to:
  /// **'Ninguna'**
  String get anticoagNone;

  /// No description provided for @fieldVentMode.
  ///
  /// In es, this message translates to:
  /// **'Modo ventilatorio'**
  String get fieldVentMode;

  /// No description provided for @fieldFio2.
  ///
  /// In es, this message translates to:
  /// **'FiO₂ (0.21–1.0)'**
  String get fieldFio2;

  /// No description provided for @fieldPeep.
  ///
  /// In es, this message translates to:
  /// **'PEEP (cmH₂O)'**
  String get fieldPeep;

  /// No description provided for @fieldVt.
  ///
  /// In es, this message translates to:
  /// **'Volumen tidal progr. (mL)'**
  String get fieldVt;

  /// No description provided for @fieldPControl.
  ///
  /// In es, this message translates to:
  /// **'Presión control (cmH₂O)'**
  String get fieldPControl;

  /// No description provided for @fieldRrSet.
  ///
  /// In es, this message translates to:
  /// **'FR programada (rpm)'**
  String get fieldRrSet;

  /// No description provided for @fieldIERatio.
  ///
  /// In es, this message translates to:
  /// **'Relación I:E'**
  String get fieldIERatio;

  /// No description provided for @fieldPSupport.
  ///
  /// In es, this message translates to:
  /// **'Presión soporte PSV (cmH₂O)'**
  String get fieldPSupport;

  /// No description provided for @fieldTrigger.
  ///
  /// In es, this message translates to:
  /// **'Trigger'**
  String get fieldTrigger;

  /// No description provided for @fieldPeak.
  ///
  /// In es, this message translates to:
  /// **'Presión pico (cmH₂O)'**
  String get fieldPeak;

  /// No description provided for @fieldPlateau.
  ///
  /// In es, this message translates to:
  /// **'Presión meseta (cmH₂O)'**
  String get fieldPlateau;

  /// No description provided for @fieldMeanAirway.
  ///
  /// In es, this message translates to:
  /// **'Presión media vía aérea (cmH₂O)'**
  String get fieldMeanAirway;

  /// No description provided for @fieldVtExp.
  ///
  /// In es, this message translates to:
  /// **'VT espirado (mL)'**
  String get fieldVtExp;

  /// No description provided for @fieldRrTotal.
  ///
  /// In es, this message translates to:
  /// **'FR total (rpm)'**
  String get fieldRrTotal;

  /// No description provided for @fieldMinVol.
  ///
  /// In es, this message translates to:
  /// **'Volumen minuto (L/min)'**
  String get fieldMinVol;

  /// No description provided for @fieldLeak.
  ///
  /// In es, this message translates to:
  /// **'Fuga (%)'**
  String get fieldLeak;

  /// No description provided for @fieldPao2.
  ///
  /// In es, this message translates to:
  /// **'PaO₂ gases arteriales (mmHg)'**
  String get fieldPao2;

  /// No description provided for @fieldPfRatio.
  ///
  /// In es, this message translates to:
  /// **'P/F ratio'**
  String get fieldPfRatio;

  /// No description provided for @fieldDrivingPressure.
  ///
  /// In es, this message translates to:
  /// **'Driving pressure (cmH₂O)'**
  String get fieldDrivingPressure;

  /// No description provided for @fieldCompliance.
  ///
  /// In es, this message translates to:
  /// **'Compliance estática (mL/cmH₂O)'**
  String get fieldCompliance;

  /// No description provided for @ardsMild.
  ///
  /// In es, this message translates to:
  /// **'Leve (P/F 200–300)'**
  String get ardsMild;

  /// No description provided for @ardsModerate.
  ///
  /// In es, this message translates to:
  /// **'Moderado (P/F 100–200)'**
  String get ardsModerate;

  /// No description provided for @ardsSevere.
  ///
  /// In es, this message translates to:
  /// **'Grave (P/F < 100)'**
  String get ardsSevere;

  /// No description provided for @ardsNone.
  ///
  /// In es, this message translates to:
  /// **'Sin criterios ARDS'**
  String get ardsNone;

  /// No description provided for @historiaTitle.
  ///
  /// In es, this message translates to:
  /// **'Historia Clínica'**
  String get historiaTitle;

  /// No description provided for @historiaEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar Historia'**
  String get historiaEdit;

  /// No description provided for @historiaSaved.
  ///
  /// In es, this message translates to:
  /// **'Historia clínica guardada'**
  String get historiaSaved;

  /// No description provided for @noHistoria.
  ///
  /// In es, this message translates to:
  /// **'Sin historia clínica registrada'**
  String get noHistoria;

  /// No description provided for @fieldHea.
  ///
  /// In es, this message translates to:
  /// **'HEA — Historia de la Enfermedad Actual'**
  String get fieldHea;

  /// No description provided for @fieldApp.
  ///
  /// In es, this message translates to:
  /// **'APP — Antecedentes Patológicos Personales'**
  String get fieldApp;

  /// No description provided for @fieldApf.
  ///
  /// In es, this message translates to:
  /// **'APF — Antecedentes Patológicos Familiares'**
  String get fieldApf;

  /// No description provided for @fieldAlergias.
  ///
  /// In es, this message translates to:
  /// **'Alergias'**
  String get fieldAlergias;

  /// No description provided for @addAlergia.
  ///
  /// In es, this message translates to:
  /// **'Agregar alergia'**
  String get addAlergia;

  /// No description provided for @fieldOperacionesPrevias.
  ///
  /// In es, this message translates to:
  /// **'Operaciones previas'**
  String get fieldOperacionesPrevias;

  /// No description provided for @fieldDatosPositivos.
  ///
  /// In es, this message translates to:
  /// **'Datos positivos del interrogatorio'**
  String get fieldDatosPositivos;

  /// No description provided for @fieldExamenFisico.
  ///
  /// In es, this message translates to:
  /// **'Examen físico por aparatos y sistemas'**
  String get fieldExamenFisico;

  /// No description provided for @auditAction_create.
  ///
  /// In es, this message translates to:
  /// **'Registro'**
  String get auditAction_create;

  /// No description provided for @auditAction_update.
  ///
  /// In es, this message translates to:
  /// **'Actualización'**
  String get auditAction_update;

  /// No description provided for @auditAction_invalidate.
  ///
  /// In es, this message translates to:
  /// **'Invalidación'**
  String get auditAction_invalidate;

  /// No description provided for @auditAction_read.
  ///
  /// In es, this message translates to:
  /// **'Lectura'**
  String get auditAction_read;

  /// No description provided for @auditAction_export.
  ///
  /// In es, this message translates to:
  /// **'Exportación'**
  String get auditAction_export;

  /// No description provided for @auditAction_login.
  ///
  /// In es, this message translates to:
  /// **'Inicio de sesión'**
  String get auditAction_login;

  /// No description provided for @auditAction_logout.
  ///
  /// In es, this message translates to:
  /// **'Cierre de sesión'**
  String get auditAction_logout;

  /// No description provided for @auditAction_calc.
  ///
  /// In es, this message translates to:
  /// **'Cálculo'**
  String get auditAction_calc;

  /// No description provided for @auditAction_pdf.
  ///
  /// In es, this message translates to:
  /// **'PDF generado'**
  String get auditAction_pdf;

  /// No description provided for @noAuditRecords.
  ///
  /// In es, this message translates to:
  /// **'Sin registros de auditoría'**
  String get noAuditRecords;

  /// No description provided for @lockTimeout20min.
  ///
  /// In es, this message translates to:
  /// **'20 minutos'**
  String get lockTimeout20min;

  /// No description provided for @lockTimeout30min.
  ///
  /// In es, this message translates to:
  /// **'30 minutos'**
  String get lockTimeout30min;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
