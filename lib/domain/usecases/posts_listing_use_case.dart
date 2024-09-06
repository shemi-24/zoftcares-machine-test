import 'package:dartz/dartz.dart';
import 'package:zoftcare_machine_test/domain/params/posts_listing_params.dart';
import 'package:zoftcare_machine_test/domain/repository/data_repository.dart';
import 'package:zoftcare_machine_test/domain/usecases/usecase.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../entities/app_error.dart';
import '../params/auth_params.dart';
import '../repository/auth_repository.dart';

class PostsListingUseCase extends UseCase<Map<String, dynamic>, PostListingParams> {
  final DataRepository _dataRepository;

  PostsListingUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(PostListingParams params) async {

    consoleLog("THE PARAMS ARE:");
    consoleLog(params);


    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());

    consoleLog("THE PARAMS AFTER MAP CREATION:");
    consoleLog(params);

    return await _dataRepository.getPosts(newParams);
  }


}
