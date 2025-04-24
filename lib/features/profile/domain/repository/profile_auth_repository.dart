import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';

abstract interface class ProfileAuthRepository {
  Future<Result<UserDataResponseEntity>> getUserData();
}