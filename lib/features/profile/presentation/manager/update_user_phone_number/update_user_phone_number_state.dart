part of 'update_user_phone_number_cubit.dart';

@freezed
class UpdateUserPhoneNumberState with _$UpdateUserPhoneNumberState {
  const factory UpdateUserPhoneNumberState.initial() = _Initial;
  const factory UpdateUserPhoneNumberState.loading() = _Loading;
  const factory UpdateUserPhoneNumberState.failure({String? message, int? statusCode}) = _Failure;
  const factory UpdateUserPhoneNumberState.success({required UpdateUserDataResponseEntity? data}) = _Success;
}
