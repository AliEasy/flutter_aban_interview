import 'package:flutter_aban_interview/features/profile/data/model/user_data_response_model.dart';

abstract interface class ProfileAuthDataSource {
  Future<UserDataResponseModel> getUserData();
}