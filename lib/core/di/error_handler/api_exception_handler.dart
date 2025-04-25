import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';

extension ErrorApiResultExtension on Object {
  Result<T> toResult<T>() {
    String? errorMsg;
    try {
      if (this is DioException) {
        DioException dioException = this as DioException;
        switch (dioException.type) {
          case DioExceptionType.badResponse:
            switch (dioException.response?.statusCode) {
              case 400:
                if (dioException.response?.data != null && dioException.response?.data is Map<String, dynamic>) {
                  errorMsg = dioException.response?.data['message'];
                }
                errorMsg ??= S.current.api_exception_400;
              case 401:
                if (dioException.response?.data != null && dioException.response?.data is Map<String, dynamic>) {
                  errorMsg = dioException.response?.data['message'];
                }
                errorMsg ??= S.current.api_exception_401;
              case 403:
                if (dioException.response?.data != null && dioException.response?.data is Map<String, dynamic>) {
                  errorMsg = dioException.response?.data['message'];
                }
                errorMsg ??= S.current.api_exception_403;
              case 404:
                if (dioException.response?.data != null && dioException.response?.data is Map<String, dynamic>) {
                  errorMsg = dioException.response?.data['message'];
                }
                errorMsg ??= S.current.api_exception_404;
              case 500:
                if (dioException.response?.data != null && dioException.response?.data is Map<String, dynamic>) {
                  errorMsg = dioException.response?.data['message'];
                }
                errorMsg ??= S.current.api_exception_500;
              default:
                errorMsg = '${S.current.api_exception_unknown_status_code} ${dioException.response?.statusCode}';
            }
          case DioExceptionType.connectionTimeout:
            errorMsg = S.current.api_exception_connection_timeout;
          case DioExceptionType.sendTimeout:
            errorMsg = S.current.api_exception_send_timeout;
          case DioExceptionType.receiveTimeout:
            errorMsg = S.current.api_exception_receive_timeout;
          case DioExceptionType.badCertificate:
            errorMsg = S.current.api_exception_bad_certificate;
          case DioExceptionType.cancel:
            errorMsg = S.current.api_exception_cancel;
          case DioExceptionType.connectionError:
            errorMsg = S.current.api_exception_connection_error;
          case DioExceptionType.unknown:
            errorMsg = S.current.api_exception_unknown;
        }
      } else if (this is FormatException || this is TypeError || this is ArgumentError) {
        errorMsg = S.current.api_exception_format_json;
      } else if (this is InvalidTokenException) {
        errorMsg = S.current.api_exception_invalid_token;
      }
    } catch (e) {
      errorMsg = S.current.api_exception_internal_handler;
    }
    return Result.failure(message: errorMsg ?? S.current.unknown_error);
  }
}

class InvalidTokenException implements Exception {}
