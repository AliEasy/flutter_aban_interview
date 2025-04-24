import 'package:flutter_aban_interview/core/model/result.dart';

abstract interface class FavoriteCryptocurrencyRepository {
  Future<Result> addToFavorites(int cryptocurrencyId);
  Future<Result> deleteFromFavorites(int cryptocurrencyId);
}
