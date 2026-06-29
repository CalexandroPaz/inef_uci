import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _keyLockTimeout = 'inef_lock_timeout_min';

  Future<int> getLockTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyLockTimeout) ?? 5;
  }

  Future<void> setLockTimeout(int minutes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyLockTimeout, minutes);
  }
}
