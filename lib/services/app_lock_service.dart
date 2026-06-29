import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:inef_uci/core/constants/app_constants.dart';
import 'package:inef_uci/services/key_vault_service.dart';

enum AppLockState { locked, unlocked, settingUpPin }

class AppLockService extends ChangeNotifier {
  final KeyVaultService _keyVault;

  AppLockService(this._keyVault);

  AppLockState _state = AppLockState.locked;
  AppLockState get state => _state;
  bool get isLocked => _state == AppLockState.locked;

  int _failedAttempts = 0;
  int get failedAttempts => _failedAttempts;
  bool _lockedOut = false;
  bool get isLockedOut => _lockedOut;
  DateTime? _lockoutUntil;

  int _autoLockSeconds = AppConstants.autoLockDefaultSeconds;
  Timer? _autoLockTimer;

  void setAutoLockDuration(int seconds) {
    _autoLockSeconds = seconds;
  }

  void resetAutoLockTimer() {
    _autoLockTimer?.cancel();
    _autoLockTimer = Timer(Duration(seconds: _autoLockSeconds), _triggerAutoLock);
  }

  void _triggerAutoLock() {
    _lock();
  }

  Future<bool> tryUnlockWithPin(String pin) async {
    if (_isInLockout()) return false;
    final valid = await _keyVault.verifyPin(pin);
    if (!valid) {
      _failedAttempts++;
      if (_failedAttempts >= AppConstants.maxPinAttempts) {
        _activateLockout();
      }
      notifyListeners();
      return false;
    }
    await _keyVault.loadDmk();
    _failedAttempts = 0;
    _lockedOut = false;
    _state = AppLockState.unlocked;
    resetAutoLockTimer();
    notifyListeners();
    return true;
  }

  bool _isInLockout() {
    if (!_lockedOut) return false;
    if (_lockoutUntil != null && DateTime.now().isAfter(_lockoutUntil!)) {
      _lockedOut = false;
      _failedAttempts = 0;
      return false;
    }
    return true;
  }

  void _activateLockout() {
    _lockedOut = true;
    final backoff = AppConstants.lockoutBaseDurationSeconds *
        (1 << (_failedAttempts - AppConstants.maxPinAttempts).clamp(0, 6));
    _lockoutUntil = DateTime.now().add(Duration(seconds: backoff));
  }

  void _lock() {
    _keyVault.lockAndClearDmk();
    _state = AppLockState.locked;
    _autoLockTimer?.cancel();
    notifyListeners();
  }

  void lockManually() => _lock();

  void setUnlocked() {
    _state = AppLockState.unlocked;
    resetAutoLockTimer();
    notifyListeners();
  }

  void setSettingUpPin() {
    _state = AppLockState.settingUpPin;
    notifyListeners();
  }

  Duration? get lockoutRemaining {
    if (!_lockedOut || _lockoutUntil == null) return null;
    final remaining = _lockoutUntil!.difference(DateTime.now());
    return remaining.isNegative ? null : remaining;
  }

  @override
  void dispose() {
    _autoLockTimer?.cancel();
    super.dispose();
  }
}
