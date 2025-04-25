import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/add_to_favorite_cryptocurrency_use_case.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/delete_from_favorite_cryptocurrency_use_case.dart';
import 'package:flutter_aban_interview/features/home/presentation/manager/favorite/favorite_cryptocurrency_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAddToFavoriteCryptocurrencyUseCase extends Mock implements AddToFavoriteCryptocurrencyUseCase {}

class MocDeleteFromFavoriteCryptocurrencyUseCase extends Mock implements DeleteFromFavoriteCryptocurrencyUseCase {}

main() {
  late FavoriteCryptocurrencyCubit favoriteCryptocurrencyCubit;
  late MockAddToFavoriteCryptocurrencyUseCase mockAddToFavoriteCryptocurrencyUseCase;
  late MocDeleteFromFavoriteCryptocurrencyUseCase mocDeleteFromFavoriteCryptocurrencyUseCase;

  setUp(
    () {
      mockAddToFavoriteCryptocurrencyUseCase = MockAddToFavoriteCryptocurrencyUseCase();
      mocDeleteFromFavoriteCryptocurrencyUseCase = MocDeleteFromFavoriteCryptocurrencyUseCase();
      favoriteCryptocurrencyCubit = FavoriteCryptocurrencyCubit(mockAddToFavoriteCryptocurrencyUseCase, mocDeleteFromFavoriteCryptocurrencyUseCase);
    },
  );

  tearDown(
    () => favoriteCryptocurrencyCubit.close(),
  );

  group(
    'test FavoriteCryptocurrencyCubit',
    () {
      blocTest<FavoriteCryptocurrencyCubit, FavoriteCryptocurrencyState>(
        'test addToFavorites success',
        build: () {
          when(
            () => mockAddToFavoriteCryptocurrencyUseCase.call(1),
          ).thenAnswer(
            (invocation) async => Result.success(),
          );
          return favoriteCryptocurrencyCubit;
        },
        act: (cubit) => cubit.addToFavorites(1),
        expect: () => [
          FavoriteCryptocurrencyState.loading(),
          FavoriteCryptocurrencyState.success(),
        ],
      );

      blocTest<FavoriteCryptocurrencyCubit, FavoriteCryptocurrencyState>(
        'test addToFavorites failure',
        build: () {
          when(
            () => mockAddToFavoriteCryptocurrencyUseCase.call(1),
          ).thenAnswer(
            (invocation) async => Result.failure(message: 'failure'),
          );
          return favoriteCryptocurrencyCubit;
        },
        act: (cubit) => cubit.addToFavorites(1),
        expect: () => [
          FavoriteCryptocurrencyState.loading(),
          FavoriteCryptocurrencyState.failure(message: 'failure'),
        ],
      );

      blocTest<FavoriteCryptocurrencyCubit, FavoriteCryptocurrencyState>(
        'test deleteFromFavorites success',
        build: () {
          when(
            () => mocDeleteFromFavoriteCryptocurrencyUseCase.call(1),
          ).thenAnswer(
            (invocation) async => Result.success(),
          );
          return favoriteCryptocurrencyCubit;
        },
        act: (cubit) => cubit.deleteFromFavorites(1),
        expect: () => [
          FavoriteCryptocurrencyState.loading(),
          FavoriteCryptocurrencyState.success(),
        ],
      );

      blocTest<FavoriteCryptocurrencyCubit, FavoriteCryptocurrencyState>(
        'test deleteFromFavorites failure',
        build: () {
          when(
            () => mocDeleteFromFavoriteCryptocurrencyUseCase.call(1),
          ).thenAnswer(
            (invocation) async => Result.failure(message: 'failure'),
          );
          return favoriteCryptocurrencyCubit;
        },
        act: (cubit) => cubit.deleteFromFavorites(1),
        expect: () => [
          FavoriteCryptocurrencyState.loading(),
          FavoriteCryptocurrencyState.failure(message: 'failure'),
        ],
      );
    },
  );
}
