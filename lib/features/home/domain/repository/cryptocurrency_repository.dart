import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';

abstract interface class CryptocurrencyRepository {
  Future<Result<List<CryptocurrencyResponseEntity>>> getCryptocurrencyList();
}
