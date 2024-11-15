import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  late FlutterSecureStorage _storage;

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._internal();

  Future<void> initStorage() async {
    _storage = const FlutterSecureStorage();
  }

  Future<bool> isLoggedIn() async {
    var value = await _storage.read(key: 'isLoggedIn') ?? "";
    return value == "true";
  }

  Future<void> setIsLoggedIn(bool enabled) async {
    return await _storage.write(
        key: 'isLoggedIn', value: enabled ? "true" : "false");
  }

  // GET y SET de token
  Future<String?> get jwt async {
    return await _storage.read(key: 'jwt') ?? "";
  }

  Future<void> setJwt(String value) async {
    await _storage.write(key: 'jwt', value: value);
  }

  // GET y SET datos del usuario
  Future<String?> get userData async {
    return await _storage.read(key: 'userData') ?? "";
  }

  Future<void> setUserData(String value) async {
    await _storage.write(key: 'userData', value: value);
  }

  // GET y SET token notificacion del usuario
  Future<String?> get tokenNotification async {
    return await _storage.read(key: 'tokenNotification') ?? "";
  }

  Future<void> setTokenNotification(String value) async {
    await _storage.write(key: 'tokenNotification', value: value);
  }

  Future<String?> get refreshToken async {
    return await _storage.read(key: 'refreshToken') ?? "";
  }

  Future<void> setRefreshToken(String value) async {
    await _storage.write(key: 'refreshToken', value: value);
  }

  Future<void> flushData() async {
    await _storage.delete(key: 'jwt');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'userData');
    await _storage.delete(key: 'tokenNotification');
    await setIsLoggedIn(false);
  }

  Future<void> clearUserData() async {
    await _storage.delete(key: 'userData');
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'fcmToken');
    await setIsLoggedIn(false);
  }
}

final SecureStorage secureStorage = SecureStorage();
