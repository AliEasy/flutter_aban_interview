import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/features/home/data/data_source/cryptocurrency_data_source.dart';
import 'package:flutter_aban_interview/features/home/data/model/cryptocurrency_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CryptocurrencyDataSource)
class CryptocurrencyDataSourceImpl implements CryptocurrencyDataSource {
  final Dio _dio;

  CryptocurrencyDataSourceImpl(@Named('crypto') this._dio);

  @override
  Future<List<CryptocurrencyResponseModel>> getCryptocurrencyList() async {
    final result = await _dio.get('cryptocurrency');
    return (result.data as List)
        .map((e) => CryptocurrencyResponseModel.fromJson(e))
        .toList();
  }
}
