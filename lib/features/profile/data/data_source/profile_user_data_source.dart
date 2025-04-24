import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_request_model.dart';
import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_response_model.dart';

abstract interface class ProfileUserDataSource {
  Future<UpdateUserDataResponseModel> updateUserData(UpdateUserDataRequestModel body);
}
