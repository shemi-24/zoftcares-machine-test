import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params);

  Future<Either<AppError, Map<String, dynamic>>> getAppVersion();

}
