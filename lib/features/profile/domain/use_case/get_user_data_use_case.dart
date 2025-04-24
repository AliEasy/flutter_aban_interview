import 'package:flutter_aban_interview/core/model/base_use_case.dart';
import 'package:flutter_aban_interview/core/model/result.dart';
import 'package:flutter_aban_interview/features/profile/domain/entity/user_data_response_entity.dart';
import 'package:flutter_aban_interview/features/profile/domain/repository/profile_auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase extends BaseUseCaseNoArgs<Result<UserDataResponseEntity>> {
  GetUserDataUseCase(this._profileAuthRepository);

  final ProfileAuthRepository _profileAuthRepository;

  @override
  Future<Result<UserDataResponseEntity>> call() async {
    return _profileAuthRepository.getUserData();
  }
}
