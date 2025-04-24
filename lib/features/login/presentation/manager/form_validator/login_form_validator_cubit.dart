import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/core/common/constants/regex.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_form_validator_state.dart';

part 'login_form_validator_cubit.freezed.dart';

@injectable
class LoginFormValidatorCubit extends Cubit<LoginFormValidatorState> {
  LoginFormValidatorCubit() : super(const LoginFormValidatorState.invalid());

  bool _emailIsValid = false;
  bool _passwordIsValid = false;

  String? validateEmail(String email) {
    final isValid = RegExp(emailRegex).hasMatch(email);
    if (isValid) {
      _emailIsValid = true;
      _validateForm();
      return null;
    } else {
      _emailIsValid = false;
      return S.current.email_is_not_valid;
    }
  }

  String? validatePassword(String password) {
    final isValid = password.trim().isNotEmpty;
    if (isValid) {
      _passwordIsValid = true;
      _validateForm();
      return null;
    } else {
      _passwordIsValid = false;
      return S.current.password_is_not_valid;
    }
  }

  _validateForm() {
    if (_emailIsValid && _passwordIsValid) {
      emit(const LoginFormValidatorState.valid());
    } else {
      emit(const LoginFormValidatorState.invalid());
    }
  }
}
