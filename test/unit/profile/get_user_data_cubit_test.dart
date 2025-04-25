import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/get_user_data/get_user_data_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserDataUseCase extends Mock implements GetUserDataUseCase {}

main() {
  late MockGetUserDataUseCase mockGetUserDataUseCase;
  late GetUserDataCubit getUserDataCubit;

  setUp(
    () {
      mockGetUserDataUseCase = MockGetUserDataUseCase();
      getUserDataCubit = GetUserDataCubit(mockGetUserDataUseCase);
    },
  );

  tearDown(
    () => getUserDataCubit.close(),
  );

  UserDataResponseEntity resultData = UserDataResponseEntity(
    email: '',
    id: 0,
    createdAt: 0,
    name: '',
    phoneNumber: '',
  );

  group(
    'test GetUserDataCubit',
    () {
      blocTest<GetUserDataCubit, GetUserDataState>(
        'test getUserData success',
        build: () {
          when(() => mockGetUserDataUseCase.call()).thenAnswer(
            (invocation) async => Result.success(data: resultData),
          );
          return getUserDataCubit;
        },
        act: (cubit) => cubit.getUserData(),
        expect: () => [
          GetUserDataState.loading(),
          GetUserDataState.success(userData: resultData),
        ],
      );

      blocTest<GetUserDataCubit, GetUserDataState>(
        'test getUserData failure',
        build: () {
          when(() => mockGetUserDataUseCase.call()).thenAnswer(
            (invocation) async => Result.failure(message: 'message'),
          );
          return getUserDataCubit;
        },
        act: (cubit) => cubit.getUserData(),
        expect: () => [
          GetUserDataState.loading(),
          GetUserDataState.failure(message: 'message'),
        ],
      );
    },
  );
}
