import 'package:flutter_aban_interview/core/model/base_use_case.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';
import 'package:flutter_aban_interview/features/home/domain/repository/cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CryptocurrencyUseCase
    extends BaseUseCaseNoArgs<Result<List<CryptocurrencyResponseEntity>>> {
  CryptocurrencyUseCase(this._cryptocurrencyRepository);

  final CryptocurrencyRepository _cryptocurrencyRepository;

  @override
  Future<Result<List<CryptocurrencyResponseEntity>>> call() async {
    return _cryptocurrencyRepository.getCryptocurrencyList();
  }
}
