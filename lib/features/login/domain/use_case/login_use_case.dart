import 'package:flutter_aban_interview/core/model/base_use_case.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';
import 'package:flutter_aban_interview/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends BaseUseCase<Result, LoginRequestEntity> {
  LoginUseCase(this._loginRepository);

  final LoginRepository _loginRepository;

  @override
  Future<Result> call(arg) async {
    return _loginRepository.login(arg);
  }
}
