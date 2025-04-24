import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';

abstract interface class LoginRepository {
  Future<Result> login(LoginRequestEntity body);
}