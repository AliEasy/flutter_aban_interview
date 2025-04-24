part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.failure({String? message, int? statusCode}) = _Failure;
  const factory LoginState.success() = _Success;
}
