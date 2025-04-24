import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/data/data_source/profile_user_data_source.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_mapper.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_mapper.dart';
import 'package:flutter_aban_interview/features/profile/domain/repository/profile_user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileUserRepository)
class ProfileUserRepositoryImpl implements ProfileUserRepository {
  final ProfileUserDataSource _profileUserDataSource;

  ProfileUserRepositoryImpl(this._profileUserDataSource);

  @override
  Future<Result<UpdateUserDataResponseEntity>> updateUserData(
      UpdateUserDataRequestEntity body) async {
    try {
      final result = await _profileUserDataSource.updateUserData(body.mapper());
      return Result.success(data: result.mapper());
    } catch (e) {
      return const Result.failure(); //todo
    }
  }
}
