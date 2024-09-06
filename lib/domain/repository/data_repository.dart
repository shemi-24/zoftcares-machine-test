import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class DataRepository{
  Future<Either<AppError, Map<String, dynamic>>> getPosts(Map<String,dynamic> params);

}