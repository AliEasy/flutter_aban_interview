import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/home/domain/entity/cryptocurrency_response_entity.dart';
import 'package:flutter_aban_interview/features/home/domain/use_case/cryptocurrency_use_case.dart';
import 'package:flutter_aban_interview/features/home/presentation/manager/list/cryptocurrency_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptocurrencyUseCase extends Mock implements CryptocurrencyUseCase {}

main() {
  late CryptocurrencyListCubit cryptocurrencyListCubit;
  late MockCryptocurrencyUseCase mockCryptocurrencyUseCase;

  setUp(() {
    mockCryptocurrencyUseCase = MockCryptocurrencyUseCase();
    cryptocurrencyListCubit = CryptocurrencyListCubit(mockCryptocurrencyUseCase);
  });

  tearDown(
    () => cryptocurrencyListCubit.close(),
  );

  group(
    'test CryptocurrencyListCubit',
    () {
      blocTest<CryptocurrencyListCubit, CryptocurrencyListState>(
        'test getList success',
        build: () {
          when(
            () => mockCryptocurrencyUseCase.call(),
          ).thenAnswer(
            (invocation) async => Result.success(data: <CryptocurrencyResponseEntity>[]),
          );
          return cryptocurrencyListCubit;
        },
        act: (cubit) => cubit.getList(),
        expect: () => [
          CryptocurrencyListState.loading(),
          CryptocurrencyListState.success(list: <CryptocurrencyResponseEntity>[])
        ],
      );

      blocTest<CryptocurrencyListCubit, CryptocurrencyListState>(
        'test getList failure',
        build: () {
          when(
                () => mockCryptocurrencyUseCase.call(),
          ).thenAnswer(
                (invocation) async => Result.failure(message: 'failure'),
          );
          return cryptocurrencyListCubit;
        },
        act: (cubit) => cubit.getList(),
        expect: () => [
          CryptocurrencyListState.loading(),
          CryptocurrencyListState.failure(message: 'failure')
        ],
      );

      blocTest<CryptocurrencyListCubit, CryptocurrencyListState>(
        'test toggleFavorite',
        build: () {
          when(
                () => mockCryptocurrencyUseCase.call(),
          ).thenAnswer(
                (invocation) async => Result.success(data: <CryptocurrencyResponseEntity>[]),
          );
          return cryptocurrencyListCubit;
        },
        act: (cubit) => cubit.toggleFavorite(1),
        expect: () => [
          CryptocurrencyListState.success(list: <CryptocurrencyResponseEntity>[])
        ],
      );
    },
  );
}
