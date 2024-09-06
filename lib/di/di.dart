
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart';
import 'package:zoftcare_machine_test/domain/usecases/posts_listing_use_case.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';

import '../data/core/api_client.dart';
import '../data/data_sources/auth_local_data_source.dart';
import '../data/data_sources/auth_remote_data_source.dart';
import '../data/data_sources/common_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/data_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/data_repository.dart';
import '../domain/usecases/app_version_check_use_case.dart';
import '../domain/usecases/login_use_case.dart';

import '../presentation/screens/authentication/getx/auth_controller.dart';
import '../presentation/screens/authentication/login_bloc/login_bloc.dart';
import '../presentation/screens/splash/bloc/splash_bloc.dart';


class DependencyInjection {

  final sl = GetIt.instance;

  Future<void> init() async{




    // BLOC RELATED DEPENDENCIES

    sl.registerFactory(()=>LoginBloc());
    sl.registerFactory(()=>SplashBloc());
    sl.registerFactory(()=>PostBloc());




    // GETX RELATED DEPENDENCIES

    Get.put<ApiClient>(ApiClient(Client()));
    Get.put<AuthController>( AuthController());



    // Get.lazyPut<DataRepository>(
    //         () => DataRepositoryImpl(Get.find(), Get.find()),
    //     fenix: true);
    // Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()),
    //     fenix: true);


    // REPOSITORIES AND DATA SOURCES DEPENDENCIES

    Get.lazyPut<AuthenticationLocalDataSource>(
            () => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(
            () => AuthenticationRemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationRepository>(
            () => AuthRepositoryImpl(Get.find(),Get.find()),
        fenix: true);
    Get.lazyPut<DataRepository>(()=>DataRepositoryImpl(Get.find()));

    Get.lazyPut<CommonDataSource>(()=> CommonDataSourceImpl(Get.find()));



    // USECASE DEPENDENCIES

    Get.lazyPut(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => AppVersionFindUseCase(Get.find()),fenix: true);
    Get.lazyPut(() => PostsListingUseCase(Get.find()),fenix: true);


  }
}
