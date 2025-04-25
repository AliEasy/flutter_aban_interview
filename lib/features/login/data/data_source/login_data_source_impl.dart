import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/core/di/error_handler/api_exception_handler.dart';
import 'package:flutter_aban_interview/core/storage/token_secure_storage/token_secure_storage.dart';
import 'package:flutter_aban_interview/features/login/data/data_source/login_data_source.dart';
import 'package:flutter_aban_interview/features/login/data/model/login_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  final Dio _dio;
  final TokenSecureStorage _tokenSecureStorage;

  LoginDataSourceImpl(@Named('auth') this._dio, this._tokenSecureStorage);

  @override
  Future<void> login(LoginRequestModel body) async {
    final result = await _dio.post('auth/login', data: body.toJson());
    final String token = result.data['authToken'];
    if (token.isNotEmpty) {
      _tokenSecureStorage.saveToken(token);
    } else {
      throw InvalidTokenException();
    }
  }
}
