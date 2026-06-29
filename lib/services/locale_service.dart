import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const _key = 'inef_locale';
  static const List<Locale> supported = [
    Locale('es'),
    Locale('en'),
    Locale('fr'),
  ];

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);
    if (code != null) {
      return supported.firstWhere(
        (l) => l.languageCode == code,
        orElse: () => const Locale('es'),
      );
    }
    final system = WidgetsBinding.instance.platformDispatcher.locale;
    return supported.firstWhere(
      (l) => l.languageCode == system.languageCode,
      orElse: () => const Locale('es'),
    );
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
  }
}
