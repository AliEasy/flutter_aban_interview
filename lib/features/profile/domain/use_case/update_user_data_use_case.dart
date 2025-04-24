import 'package:flutter_aban_interview/core/model/base_use_case.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_request_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/update_user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/repository/profile_user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserDataUseCase extends BaseUseCase<Result<UpdateUserDataResponseEntity>,
    UpdateUserDataRequestEntity> {
  UpdateUserDataUseCase(this._profileUserRepository);

  final ProfileUserRepository _profileUserRepository;

  @override
  Future<Result<UpdateUserDataResponseEntity>> call(arg) async {
    return _profileUserRepository.updateUserData(arg);
  }
}
