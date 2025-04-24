import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_request_model.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';

extension OnUpdateUserDataRequestEntity on UpdateUserDataRequestEntity {
  UpdateUserDataRequestModel mapper() {
    return UpdateUserDataRequestModel(
      phoneNumber: phoneNumber,
    );
  }
}
