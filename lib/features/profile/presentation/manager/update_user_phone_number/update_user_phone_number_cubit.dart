import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/use_case/update_user_data_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_user_phone_number_state.dart';

part 'update_user_phone_number_cubit.freezed.dart';

@injectable
class UpdateUserPhoneNumberCubit extends Cubit<UpdateUserPhoneNumberState> {
  final UpdateUserDataUseCase _updateUserDataUseCase;

  UpdateUserPhoneNumberCubit(this._updateUserDataUseCase)
      : super(const UpdateUserPhoneNumberState.initial());

  updatePhoneNumber(String phoneNumber) async {
    emit(const UpdateUserPhoneNumberState.loading());
    final result = await _updateUserDataUseCase
        .call(UpdateUserDataRequestEntity(phoneNumber: '+98$phoneNumber'));
    result.whenOrNull(
      success: (data) {
        emit(UpdateUserPhoneNumberState.success(data: data));
      },
      failure: (message, statusCode) {
        emit(UpdateUserPhoneNumberState.failure(
            message: message, statusCode: statusCode));
      },
    );
  }
}
