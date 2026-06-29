class AppConstants {
  static const String appName = 'INEF UCI';
  static const String applicationId = 'cu.inef.inef_uci';
  static const String appVersion = '1.0.0';
  static const String dmkStorageKey = 'inef_dmk_v1';
  static const String pinHashKey = 'inef_pin_hash_v1';
  static const String pinSaltKey = 'inef_pin_salt_v1';
  static const int pinLength = 6;
  static const int maxPinAttempts = 5;
  static const int lockoutBaseDurationSeconds = 30;
  static const int autoLockDefaultSeconds = 300;
  static const String dbFileName = 'inef_uci.db';
  static const int dbSchemaVersion = 3;
  static const String catalogAssetPath = 'assets/data/parametros_clinicos.json';
  static const String ktvCalculatorId = 'ktv_daugirdas_ii';
  static const double ktvAdequacyThreshold = 1.2;
  static const double ufRateAlarmThresholdMlKgH = 13.0;
}
