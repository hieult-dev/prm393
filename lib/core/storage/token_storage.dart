import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _s = FlutterSecureStorage();
  static const _kAuth = 'authentication';
  static const _kRefresh = 'refreshToken';

  static Future<String?> getAuthentication() => _s.read(key: _kAuth);
  static Future<String?> getRefreshToken() => _s.read(key: _kRefresh);

  static Future<void> setAuthentication(String value) =>
      _s.write(key: _kAuth, value: value);

  static Future<void> setRefreshToken(String value) =>
      _s.write(key: _kRefresh, value: value);

  static Future<void> clear() async {
    await _s.delete(key: _kAuth);
    await _s.delete(key: _kRefresh);
  }
}
