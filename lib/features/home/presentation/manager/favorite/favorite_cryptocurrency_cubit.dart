import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/add_to_favorite_cryptocurrency_use_case.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/delete_from_favorite_cryptocurrency_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_cryptocurrency_state.dart';

part 'favorite_cryptocurrency_cubit.freezed.dart';

@injectable
class FavoriteCryptocurrencyCubit extends Cubit<FavoriteCryptocurrencyState> {
  final AddToFavoriteCryptocurrencyUseCase _addToFavoriteCryptocurrencyUseCase;
  final DeleteFromFavoriteCryptocurrencyUseCase
      _deleteFromFavoriteCryptocurrencyUseCase;

  FavoriteCryptocurrencyCubit(this._addToFavoriteCryptocurrencyUseCase,
      this._deleteFromFavoriteCryptocurrencyUseCase)
      : super(const FavoriteCryptocurrencyState.initial());

  addToFavorites(int cryptocurrencyId) async {
    emit(const FavoriteCryptocurrencyState.loading());
    final result = await _addToFavoriteCryptocurrencyUseCase.call(cryptocurrencyId);
    result.whenOrNull(
      success: (data) {
        emit(const FavoriteCryptocurrencyState.success());
      },
      failure: (message, statusCode) {
        emit(const FavoriteCryptocurrencyState.failure());
      },
    );
  }

  deleteFromFavorites(int cryptocurrencyId) async {
    emit(const FavoriteCryptocurrencyState.loading());
    final result =
        await _deleteFromFavoriteCryptocurrencyUseCase.call(cryptocurrencyId);
    result.whenOrNull(
      success: (data) {
        emit(const FavoriteCryptocurrencyState.success());
      },
      failure: (message, statusCode) {
        emit(const FavoriteCryptocurrencyState.failure());
      },
    );
  }
}
