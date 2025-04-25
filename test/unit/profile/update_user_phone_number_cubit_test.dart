import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/use_case/update_user_data_use_case.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/update_user_phone_number/update_user_phone_number_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUpdateUserDataUseCase extends Mock implements UpdateUserDataUseCase {}
class FakeUpdateUserDataRequestEntity extends Fake implements UpdateUserDataRequestEntity {}

main() {
  late MockUpdateUserDataUseCase mockUpdateUserDataUseCase;
  late UpdateUserPhoneNumberCubit updateUserPhoneNumberCubit;

  setUp(
    () {
      mockUpdateUserDataUseCase = MockUpdateUserDataUseCase();
      updateUserPhoneNumberCubit = UpdateUserPhoneNumberCubit(mockUpdateUserDataUseCase);
      registerFallbackValue(FakeUpdateUserDataRequestEntity());
    },
  );

  tearDown(
    () => updateUserPhoneNumberCubit.close(),
  );

  final responseEntity = UpdateUserDataResponseEntity(
    phoneNumber: '',
    name: '',
    createdAt: 0,
    id: 0,
    email: '',
  );

  group(
    'test UpdateUserPhoneNumberCubit',
    () {
      blocTest<UpdateUserPhoneNumberCubit, UpdateUserPhoneNumberState>(
        'test updatePhoneNumber success',
        build: () {
          when(
            () => mockUpdateUserDataUseCase.call(any()),
          ).thenAnswer(
            (invocation) async => Result.success(
              data: responseEntity,
            ),
          );
          return updateUserPhoneNumberCubit;
        },
        act: (cubit) => cubit.updatePhoneNumber(''),
        expect: () => [
          UpdateUserPhoneNumberState.loading(),
          UpdateUserPhoneNumberState.success(data: responseEntity),
        ],
      );
    },
  );
}
