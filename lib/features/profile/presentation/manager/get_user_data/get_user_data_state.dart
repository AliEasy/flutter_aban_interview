part of 'get_user_data_cubit.dart';

@freezed
class GetUserDataState with _$GetUserDataState {
  const factory GetUserDataState.initial() = _Initial;
  const factory GetUserDataState.loading() = _Loading;
  const factory GetUserDataState.failure({String? message, int? statusCode}) = _Failure;
  const factory GetUserDataState.success({required UserDataResponseEntity? userData}) = _Success;
}
