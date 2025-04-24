part of 'cryptocurrency_list_cubit.dart';

@freezed
class CryptocurrencyListState with _$CryptocurrencyListState {
  const factory CryptocurrencyListState.initial() = _Initial;
  const factory CryptocurrencyListState.loading() = _Loading;
  const factory CryptocurrencyListState.failure({String? message, int? statusCode}) = _Failure;
  const factory CryptocurrencyListState.success({required List<CryptocurrencyResponseEntity> list}) = _Success;
}
