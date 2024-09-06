import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoftcare_machine_test/data/models/app_verision_model.dart';
import 'package:zoftcare_machine_test/domain/entities/app_version_model_entity.dart';
import 'package:zoftcare_machine_test/domain/usecases/app_version_check_use_case.dart';


import '../../../../domain/params/no_params.dart';
import '../../../../util.dart';
import '../../../../utils/debug_utils.dart';
import '../../../../utils/navigation_utils.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  AppVersionModelEntity? appVersionModelEntity;

  final AppVersionFindUseCase appVersionFindUseCase = Get.find();

  final box =  GetStorage();


  SplashBloc() : super(SplashInitial()) {


    on<SplashInitEvent>((event, emit) async {

      emit(SplashLoadingState());

      // TODO: implement event handler
      try{


        final response = await appVersionFindUseCase.call(NoParams());

        consoleLog(response);

        response.fold((left)  {
           left.handleError();
        }, (right) async {

          consoleLog(right);

          if(right["status"] == true){
            AppVersionModel appVersionModel = AppVersionModel.fromJson(right);

            appVersionModelEntity = appVersionModel.data;

            consoleLog("VERSION");
            consoleLog(appVersionModelEntity!.version);
          }

        });
        emit(SplashLoadedState());

      } catch (e) {
        emit(SplashAPILoadingError(message:e.toString()));
      }

    });
  }
}
