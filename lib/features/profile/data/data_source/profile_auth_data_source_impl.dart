import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/features/profile/data/data_source/profile_auth_data_source.dart';
import 'package:flutter_aban_interview/features/profile/data/model/user_data_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileAuthDataSource)
class ProfileAuthDataSourceImpl implements ProfileAuthDataSource {
  final Dio _dio;

  ProfileAuthDataSourceImpl(@Named('auth') this._dio);

  @override
  Future<UserDataResponseModel> getUserData() async {
    final result = await _dio.get('auth/me');
    return UserDataResponseModel.fromJson(result.data);
  }
}
