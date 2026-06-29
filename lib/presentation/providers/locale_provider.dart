import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inef_uci/services/locale_service.dart';

final localeServiceProvider = Provider<LocaleService>((ref) => LocaleService());

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(ref.read(localeServiceProvider));
});

class LocaleNotifier extends StateNotifier<Locale> {
  final LocaleService _service;

  LocaleNotifier(this._service) : super(const Locale('es')) {
    _load();
  }

  Future<void> _load() async {
    state = await _service.getLocale();
  }

  Future<void> setLocale(Locale locale) async {
    await _service.setLocale(locale);
    state = locale;
  }
}
