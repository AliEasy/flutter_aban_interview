import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/login/data/data_source/login_data_source.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_mapper.dart';
import 'package:flutter_aban_interview/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<Result> login(LoginRequestEntity body) async {
    try {
      await _loginDataSource.login(body.mapper());
      return const Result.success();
    } catch (e) {
      return const Result.failure(); //todo
    }
  }
}
