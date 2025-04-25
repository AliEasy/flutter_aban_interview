import 'package:flutter_aban_interview/core/di/error_handler/api_exception_handler.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/data/data_source/profile_auth_data_source.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_mapper.dart';
import 'package:flutter_aban_interview/features/profile/domain/repository/profile_auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileAuthRepository)
class ProfileAuthRepositoryImpl implements ProfileAuthRepository {
  final ProfileAuthDataSource _profileAuthDataSource;

  ProfileAuthRepositoryImpl(this._profileAuthDataSource);

  @override
  Future<Result<UserDataResponseEntity>> getUserData() async {
    try {
      final result = await _profileAuthDataSource.getUserData();
      return Result.success(data: result.mapper());
    } catch (e) {
      return e.toResult();
    }
  }
}
