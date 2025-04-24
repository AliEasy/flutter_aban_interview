import 'package:flutter_aban_interview/features/login/data/model/login_request_model.dart';

abstract class LoginDataSource {
  Future<void> login(LoginRequestModel body);
}
