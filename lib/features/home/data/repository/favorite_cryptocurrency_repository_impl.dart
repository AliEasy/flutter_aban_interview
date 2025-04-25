import 'package:flutter_aban_interview/core/di/error_handler/api_exception_handler.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/data/data_source/favorite_cryptocurrency_data_source.dart';
import 'package:flutter_aban_interview/features/home/domain/repository/favorite_cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteCryptocurrencyRepository)
class FavoriteCryptocurrencyRepositoryImpl
    implements FavoriteCryptocurrencyRepository {
  final FavoriteCryptocurrencyDataSource _favoriteCryptocurrencyDataSource;

  FavoriteCryptocurrencyRepositoryImpl(this._favoriteCryptocurrencyDataSource);

  @override
  Future<Result> addToFavorites(int cryptocurrencyId) async {
    try {
      await _favoriteCryptocurrencyDataSource.addToFavorites(cryptocurrencyId);
      return const Result.success();
    } catch (e) {
      return e.toResult();
    }
  }

  @override
  Future<Result> deleteFromFavorites(int cryptocurrencyId) async {
    try {
      await _favoriteCryptocurrencyDataSource.deleteFromFavorites(cryptocurrencyId);
      return const Result.success();
    } catch (e) {
      return e.toResult();
    }
  }
}
