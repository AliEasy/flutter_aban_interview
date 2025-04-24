import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_response_model.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';

extension OnUpdateUserDataResponseModel on UpdateUserDataResponseModel {
  UpdateUserDataResponseEntity mapper() {
    return UpdateUserDataResponseEntity(
      id: id,
      createdAt: createdAt,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
