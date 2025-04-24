import 'package:flutter_aban_interview/features/profile/data/model/user_data_response_model.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';

extension OnUserDataResponseModel on UserDataResponseModel {
  UserDataResponseEntity mapper() {
    return UserDataResponseEntity(
      id: id,
      createdAt: createdAt,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
