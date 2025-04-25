import 'package:flutter_aban_interview/core/di/error_handler/api_exception_handler.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/data/data_source/cryptocurrency_data_source.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_mapper.dart';
import 'package:flutter_aban_interview/features/home/domain/repository/cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CryptocurrencyRepository)
class CryptocurrencyRepositoryImpl implements CryptocurrencyRepository {
  final CryptocurrencyDataSource _cryptocurrencyDataSource;

  CryptocurrencyRepositoryImpl(this._cryptocurrencyDataSource);

  @override
  Future<Result<List<CryptocurrencyResponseEntity>>> getCryptocurrencyList() async {
    try {
      final result = await _cryptocurrencyDataSource.getCryptocurrencyList();
      return Result.success(data: result.map((e) => e.mapper()).toList());
    } catch (e) {
      return e.toResult();
    }
  }
}
