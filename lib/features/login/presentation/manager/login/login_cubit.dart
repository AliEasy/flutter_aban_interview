import 'package:bloc/bloc.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';
import 'package:flutter_aban_interview/features/login/domain/use_case/login_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  login(LoginRequestEntity body) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase.call(body);
    result.whenOrNull(
      success: (data) {
        emit(const LoginState.success());
      },
      failure: (message, statusCode) {
        emit(LoginState.failure(message: message));
      },
    );
  }
}
