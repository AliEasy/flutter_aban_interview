import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/features/home/data/data_source/favorite_cryptocurrency_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteCryptocurrencyDataSource)
class FavoriteCryptocurrencyDataSourceImpl
    implements FavoriteCryptocurrencyDataSource {
  final Dio _dio;

  FavoriteCryptocurrencyDataSourceImpl(@Named('crypto') this._dio);

  @override
  Future addToFavorites(int cryptocurrencyId) async {
    await _dio.post('/favorites', data: {'cryptocurrency_id': cryptocurrencyId});
  }

  @override
  Future deleteFromFavorites(int cryptocurrencyId) async {
    await _dio.delete('/favorites', data: {'cryptocurrency_id': cryptocurrencyId});
  }
}
