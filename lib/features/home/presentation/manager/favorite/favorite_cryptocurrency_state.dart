part of 'favorite_cryptocurrency_cubit.dart';

@freezed
class FavoriteCryptocurrencyState with _$FavoriteCryptocurrencyState {
  const factory FavoriteCryptocurrencyState.initial() = _Initial;
  const factory FavoriteCryptocurrencyState.loading() = _Loading;
  const factory FavoriteCryptocurrencyState.failure({String? message, int? statusCode}) = _Failure;
  const factory FavoriteCryptocurrencyState.success() = _Success;
}
