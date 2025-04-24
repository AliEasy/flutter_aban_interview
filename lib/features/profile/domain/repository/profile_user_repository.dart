import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';

abstract interface class ProfileUserRepository {
  Future<Result<UpdateUserDataResponseEntity>> updateUserData(UpdateUserDataRequestEntity body);
}