part of 'login_form_validator_cubit.dart';

@freezed
class LoginFormValidatorState with _$LoginFormValidatorState {
  const factory LoginFormValidatorState.invalid() = _Invalid;
  const factory LoginFormValidatorState.valid() = _Valid;
}
