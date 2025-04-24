import 'package:flutter_aban_interview/core/common/constants/secure_storage_keys.dart';
import 'package:flutter_aban_interview/core/storage/token_secure_storage/token_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenSecureStorage)
class TokenSecureStorageImpl implements TokenSecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  TokenSecureStorageImpl(this._flutterSecureStorage);

  @override
  Future<void> saveToken(String token) async {
    await _flutterSecureStorage.write(key: tokenSecureStorageKey, value: token);
  }
}
