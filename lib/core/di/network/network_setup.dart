import 'dart:io';

import 'package:flutter_aban_interview/core/di/base/di_setup.dart';
import 'package:flutter_aban_interview/core/storage/token_secure_storage/token_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class NetworkSetup {
  @singleton
  DioInterceptor get _dioInterceptor => DioInterceptor();

  @Named('auth')
  @singleton
  Dio get authDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:0uinMmtC/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(_dioInterceptor);
    return dio;
  }

  @Named('crypto')
  @singleton
  Dio get cryptoDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://x8ki-letl-twmt.n7.xano.io/api:awZizgY2/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.add(_dioInterceptor);
    return dio;
  }
}

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenSecureStorage = getIt<TokenSecureStorage>();
    final token = await tokenSecureStorage.readToken() ?? '';
    if (token.isNotEmpty && !options.path.contains('auth/login')) {
      options.headers[HttpHeaders.authorizationHeader] = token;
    }
    handler.next(options);
  }
}
