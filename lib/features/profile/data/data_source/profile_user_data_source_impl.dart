import 'package:dio/dio.dart';
import 'package:flutter_aban_interview/features/profile/data/data_source/profile_user_data_source.dart';
import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_request_model.dart';
import 'package:flutter_aban_interview/features/profile/data/model/update_user_data_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileUserDataSource)
class ProfileUserDataSourceImpl implements ProfileUserDataSource {
  final Dio _dio;

  ProfileUserDataSourceImpl(@Named('auth') this._dio);

  @override
  Future<UpdateUserDataResponseModel> updateUserData(
      UpdateUserDataRequestModel body) async {
    final result = await _dio.put('user', data: body); //wrong api path
    return UpdateUserDataResponseModel.fromJson(result.data);
  }
}
