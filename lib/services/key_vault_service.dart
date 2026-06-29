import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inef_uci/core/constants/app_constants.dart';

/// Gestiona la Clave Maestra de Datos (DMK).
///
/// La DMK es AES-256 aleatoria generada al primer arranque.
/// Se almacena en Android KeyStore vía flutter_secure_storage.
/// El PIN nunca deriva la clave de la BD — solo desbloquea el acceso al KeyStore.
///
/// Flujo:
///   Primer arranque → genera DMK → envuelve con KeyStore → abre BD con DMK.
///   Desbloqueo → verifica PIN/biometría → lee DMK del KeyStore → abre BD.
///   Bloqueo → sobreescribe referencia DMK en memoria → cierra BD.
class KeyVaultService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      resetOnError: false,
    ),
  );

  Uint8List? _dmkInMemory;

  bool get isDmkLoaded => _dmkInMemory != null;

  /// Primer arranque: genera la DMK y la persiste en KeyStore.
  Future<void> initializeDmk() async {
    final existing = await _storage.read(key: AppConstants.dmkStorageKey);
    if (existing != null) return;
    final dmk = _generateDmk();
    await _storage.write(
      key: AppConstants.dmkStorageKey,
      value: base64Encode(dmk),
    );
    _dmkInMemory = dmk;
  }

  /// Carga la DMK en memoria (llamar tras autenticación exitosa).
  Future<bool> loadDmk() async {
    final encoded = await _storage.read(key: AppConstants.dmkStorageKey);
    if (encoded == null) return false;
    _dmkInMemory = base64Decode(encoded);
    return true;
  }

  /// Retorna la DMK como string hexadecimal para SQLCipher.
  /// Solo disponible cuando está desbloqueado.
  String? get dmkHex {
    final dmk = _dmkInMemory;
    if (dmk == null) return null;
    return dmk.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  /// Bloquea: sobreescribe la DMK en memoria con ceros.
  void lockAndClearDmk() {
    if (_dmkInMemory != null) {
      _dmkInMemory!.fillRange(0, _dmkInMemory!.length, 0);
      _dmkInMemory = null;
    }
  }

  /// Guarda hash del PIN (PBKDF2-SHA256 con salt) en KeyStore.
  Future<void> setPinHash(String pin) async {
    final salt = _generateSalt();
    final hash = _pbkdf2(pin, salt);
    await _storage.write(key: AppConstants.pinHashKey, value: base64Encode(hash));
    await _storage.write(key: AppConstants.pinSaltKey, value: base64Encode(salt));
  }

  /// Verifica el PIN ingresado contra el hash almacenado.
  Future<bool> verifyPin(String pin) async {
    final hashEncoded = await _storage.read(key: AppConstants.pinHashKey);
    final saltEncoded = await _storage.read(key: AppConstants.pinSaltKey);
    if (hashEncoded == null || saltEncoded == null) return false;
    final storedHash = base64Decode(hashEncoded);
    final salt = base64Decode(saltEncoded);
    final computed = _pbkdf2(pin, salt);
    if (computed.length != storedHash.length) return false;
    int diff = 0;
    for (int i = 0; i < computed.length; i++) {
      diff |= computed[i] ^ storedHash[i];
    }
    return diff == 0;
  }

  Future<bool> hasPinConfigured() async {
    return await _storage.containsKey(key: AppConstants.pinHashKey);
  }

  Uint8List _generateDmk() {
    final rng = Random.secure();
    return Uint8List.fromList(List.generate(32, (_) => rng.nextInt(256)));
  }

  Uint8List _generateSalt() {
    final rng = Random.secure();
    return Uint8List.fromList(List.generate(16, (_) => rng.nextInt(256)));
  }

  Uint8List _pbkdf2(String pin, Uint8List salt, {int iterations = 100000}) {
    final pinBytes = utf8.encode(pin);
    var block = Uint8List(32);
    final hmac = Hmac(sha256, pinBytes);
    var u = hmac.convert([...salt, 0, 0, 0, 1]).bytes;
    block = Uint8List.fromList(u);
    for (int i = 1; i < iterations; i++) {
      u = hmac.convert(u).bytes;
      for (int j = 0; j < block.length; j++) {
        block[j] ^= u[j];
      }
    }
    return block;
  }
}
