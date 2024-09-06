import 'package:dartz/dartz.dart';
import 'package:zoftcare_machine_test/domain/usecases/usecase.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../entities/app_error.dart';
import '../params/auth_params.dart';
import '../repository/auth_repository.dart';

class LoginUseCase extends UseCase<Map<String, dynamic>, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AuthParams params) async {

    consoleLog("THE PARAMS ARE:");
    consoleLog(params);


    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());

    consoleLog("THE PARAMS AFTER MAP CREATION:");
    consoleLog(params);

    return await _authenticationRepository.login(newParams);
  }


}
