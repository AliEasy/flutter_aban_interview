import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/core/common/constants/regex.dart';
import 'package:flutter_aban_interview/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_phone_number_form_validator_state.dart';

part 'update_phone_number_form_validator_cubit.freezed.dart';

@injectable
class UpdatePhoneNumberFormValidatorCubit
    extends Cubit<UpdatePhoneNumberFormValidatorState> {
  UpdatePhoneNumberFormValidatorCubit()
      : super(const UpdatePhoneNumberFormValidatorState.invalid());

  String? validatePhoneNumber(String phoneNumber) {
    final isValid = RegExp(iranMobileNumberRegex).hasMatch(phoneNumber);
    if (isValid) {
      emit(const UpdatePhoneNumberFormValidatorState.valid());
      return null;
    } else {
      emit(const UpdatePhoneNumberFormValidatorState.invalid());
      return S.current.phone_number_is_not_valid;
    }
  }
}
