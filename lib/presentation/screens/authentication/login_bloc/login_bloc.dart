
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';

import '../../../../data/data_sources/auth_local_data_source.dart';
import '../../../../data/models/user_model.dart';
import '../../../../domain/entities/user_model_entity.dart';
import '../../../../domain/params/auth_params.dart';
import '../../../../domain/usecases/login_use_case.dart';
import '../../../../utils/debug_utils.dart';
import '../../../route/route_constants.dart';
import '../getx/auth_controller.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthController controller = Get.find();

  final AuthenticationLocalDataSource _authenticationLocalDataSource = Get.find();
  final LoginUseCase loginUseCase = Get.find();

  bool obsecure = true;

  LoginBloc() : super(LoginInitial()) {
    on<LoginCheckingEvent>((event, emit) async {
      // TODO: implement event handler

      emit(AuthLoading());


      AuthController authController = Get.find();

      // try {
        consoleLog("EVENT DATA");
        consoleLog(event.email);
        consoleLog(event.password);

        AuthParams authParams =
            AuthParams(email: event.email, password: event.password);
        consoleLog("BLOC");
        consoleLog(authParams);
        final response = await loginUseCase.call(authParams);
        consoleLog("LOGIN SUCCESS");

        consoleLog(response);

        response.fold((left) {
          left.handleError();
        }, (right) {
          consoleLog(right);
          if (right["status"] == true) {

            controller.getUser();
            final postBloc = BlocProvider.of<PostBloc>(navigator!.context);

            postBloc.add(PostLoadingEvent(1, 10));

            navigator!.pushReplacementNamed(RouteList.postsListingScreen);

            emit(Authenticated());
          } else {
            emit(AuthenticatedError(message: right["message"]));
          }

        });
      // } catch (e) {
      //   emit(AuthenticatedError(message: e.toString()));
      // }
    });

    on<LogOutEvent>((event, emit) {
      emit(AuthLoading());

      event.authenticationLocalDataSource.deleteUser();

      controller.userEntity  = null;

      // SchedulerBinding.instance.addPostFrameCallback((_){
        navService.pushReplacementNamed(RouteList.splash);
      // });


    });




    on<PasswordObsecureEvent>((event , emit){

      emit(LoadingState());

      try{
        obsecure = !obsecure;

        emit(LoadedState());

      } catch (e){
        emit(AuthenticatedError(message: e.toString()));
      }


    });
    

  }


}
