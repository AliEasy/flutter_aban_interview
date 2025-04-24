import 'package:flutter_aban_interview/features/login/data/model/login_request_model.dart';
import 'package:flutter_aban_interview/features/login/domain/entity/login_request_entity.dart';

extension OnLoginRequestEntity on LoginRequestEntity {
  LoginRequestModel mapper() {
    return LoginRequestModel(
      email: email,
      password: password,
    );
  }
}
