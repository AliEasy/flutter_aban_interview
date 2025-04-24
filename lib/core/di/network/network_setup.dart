import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class NetworkSetup {
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
    return dio;
  }
}
