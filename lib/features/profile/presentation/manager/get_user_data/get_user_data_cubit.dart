import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_user_data_state.dart';

part 'get_user_data_cubit.freezed.dart';

@injectable
class GetUserDataCubit extends Cubit<GetUserDataState> {
  final GetUserDataUseCase _getUserDataUseCase;

  GetUserDataCubit(this._getUserDataUseCase)
      : super(const GetUserDataState.initial());

  getUserData() async {
    emit(const GetUserDataState.loading());
    final result = await _getUserDataUseCase.call();
    result.whenOrNull(
      success: (data) {
        emit(GetUserDataState.success(userData: data));
      },
      failure: (message, statusCode) {
        emit(GetUserDataState.failure(message: message, statusCode: statusCode));
      },
    );
  }
}
