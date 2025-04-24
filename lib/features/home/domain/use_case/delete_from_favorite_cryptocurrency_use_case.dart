import 'package:flutter_aban_interview/core/model/base_use_case.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/domain/repository/favorite_cryptocurrency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromFavoriteCryptocurrencyUseCase extends BaseUseCase<Result, int> {
  DeleteFromFavoriteCryptocurrencyUseCase(this._favoriteCryptocurrencyRepository);

  final FavoriteCryptocurrencyRepository _favoriteCryptocurrencyRepository;

  @override
  Future<Result> call(arg) async {
    return _favoriteCryptocurrencyRepository.deleteFromFavorites(arg);
  }
}
