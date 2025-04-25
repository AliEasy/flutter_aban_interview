import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/features/login/presentation/manager/form_validator/login_form_validator_cubit.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginFormValidatorCubit loginFormValidatorCubit;

  setUp(() async {
    loginFormValidatorCubit = LoginFormValidatorCubit();
    await S.load(const Locale('en'));
  });

  tearDown(() => loginFormValidatorCubit.close());

  group('test LoginFormValidatorCubit', () {
    test('initial state is invalid', () {
      expect(loginFormValidatorCubit.state, const LoginFormValidatorState.invalid());
    });

    test('valid email and password emits valid state', () {
      final emailError = loginFormValidatorCubit.validateEmail('test@example.com');
      final passwordError = loginFormValidatorCubit.validatePassword('123456');

      expect(emailError, isNull);
      expect(passwordError, isNull);
      expect(loginFormValidatorCubit.state, const LoginFormValidatorState.valid());
    });

    test('invalid email keeps state invalid and returns error string', () {
      final emailError = loginFormValidatorCubit.validateEmail('invalid_email');

      expect(emailError, S.current.email_is_not_valid);
      expect(loginFormValidatorCubit.state, const LoginFormValidatorState.invalid());
    });

    test('empty email keeps state invalid and returns error string', () {
      final emailError = loginFormValidatorCubit.validateEmail('');

      expect(emailError, S.current.email_is_not_valid);
      expect(loginFormValidatorCubit.state, const LoginFormValidatorState.invalid());
    });

    test('empty password keeps state invalid and returns error string', () {
      final passwordError = loginFormValidatorCubit.validatePassword('');

      expect(passwordError, S.current.password_is_not_valid);
      expect(loginFormValidatorCubit.state, const LoginFormValidatorState.invalid());
    });
  });
}
