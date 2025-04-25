import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/features/profile/presentation/manager/update_phone_number_form_validator/update_phone_number_form_validator_cubit.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late UpdatePhoneNumberFormValidatorCubit updatePhoneNumberFormValidatorCubit;

  setUp(
    () async {
      updatePhoneNumberFormValidatorCubit = UpdatePhoneNumberFormValidatorCubit();
      await S.load(const Locale('en'));
    },
  );

  tearDown(
    () => updatePhoneNumberFormValidatorCubit.close(),
  );

  group(
    'test UpdatePhoneNumberFormValidatorCubit',
    () {
      test(
        'description',
        () {
          expect(updatePhoneNumberFormValidatorCubit.state, UpdatePhoneNumberFormValidatorState.invalid());
        },
      );

      test(
        'test validatePhoneNumber valid',
        () {
          final phoneNumberValid = updatePhoneNumberFormValidatorCubit.validatePhoneNumber('+989385371961');
          expect(updatePhoneNumberFormValidatorCubit.state, UpdatePhoneNumberFormValidatorState.valid());
          expect(phoneNumberValid, isNull);
        },
      );

      test(
        'test validatePhoneNumber invalid',
        () {
          final phoneNumberValid = updatePhoneNumberFormValidatorCubit.validatePhoneNumber('099385371961');
          expect(updatePhoneNumberFormValidatorCubit.state, UpdatePhoneNumberFormValidatorState.invalid());
          expect(phoneNumberValid, S.current.phone_number_is_not_valid);
        },
      );
    },
  );
}
