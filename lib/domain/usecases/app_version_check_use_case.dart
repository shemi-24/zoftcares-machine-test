import 'package:dartz/dartz.dart';
import 'package:zoftcare_machine_test/domain/params/no_params.dart';
import 'package:zoftcare_machine_test/domain/usecases/usecase.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../entities/app_error.dart';
import '../params/auth_params.dart';
import '../repository/auth_repository.dart';

class AppVersionFindUseCase extends UseCase<Map<String, dynamic>, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  AppVersionFindUseCase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(NoParams params) async {
    return await _authenticationRepository.getAppVersion();
  }


}
