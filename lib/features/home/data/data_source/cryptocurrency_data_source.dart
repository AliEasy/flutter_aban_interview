import 'package:flutter_aban_interview/features/home/data/model/cryptocurrency_response_model.dart';

abstract interface class CryptocurrencyDataSource {
  Future<List<CryptocurrencyResponseModel>> getCryptocurrencyList();
}