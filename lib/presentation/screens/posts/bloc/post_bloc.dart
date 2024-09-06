import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:zoftcare_machine_test/data/data_sources/auth_local_data_source.dart';
import 'package:zoftcare_machine_test/data/models/post_model.dart';
import 'package:zoftcare_machine_test/domain/entities/post_model_entity.dart';
import 'package:zoftcare_machine_test/domain/params/posts_listing_params.dart';
import 'package:zoftcare_machine_test/presentation/route/route_constants.dart';
import 'package:zoftcare_machine_test/presentation/screens/authentication/login_bloc/login_bloc.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

import '../../../../domain/usecases/posts_listing_use_case.dart';
import '../../../../util.dart';
import '../../../../utils/navigation_utils.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PostsListingUseCase postsListingUseCase = Get.find();
  final AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();

  List<PostModelEntity>? postModelEntityList = [];
  PostsModel? postsModel;

  int currentPage = 1;
  int size = 10;

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PostLoadingEvent>((event,emit) async {
      emit(PostLoadingState());

      try{

        final response  = await postsListingUseCase.call(PostListingParams(page: event.page, size: event.size));

        consoleLog(response);

        response.fold((left)async{
          await left.handleError();
        }, (right){
          consoleLog("POSTS FETCHED");
          consoleLog(right);

          if(right["status"] == true){
            navigator!.pushReplacementNamed(RouteList.postsListingScreen);

            PostsModel postsModel = PostsModel.fromJson(right);
            postModelEntityList = postsModel.data;
          }

          else{
            final loginBloc = BlocProvider.of<LoginBloc>(navigator!.context);
            loginBloc.add(LogOutEvent(authenticationLocalDataSource: authenticationLocalDataSource));
          }

          emit(PostLoadedState());


        });

      } catch(e){
        emit(PostLoadingErrorState(e.toString()));
      }
    });

    on<PostLoadingPaginationEvent>((event,emit) async {
      emit(PaginationLoadingState());

      try{

        final response  = await postsListingUseCase.call(PostListingParams(page: currentPage, size: size));

        consoleLog(response);

        response.fold((left){
          left.handleError();
        }, (right){
          consoleLog("POSTS FETCHED");
          consoleLog(right);

          if(right["status"] == true){

            postsModel = PostsModel.fromJson(right);
            postModelEntityList!.addAll(postsModel!.data);
          }

          else{
            final loginBloc = BlocProvider.of<LoginBloc>(navigator!.context);
            loginBloc.add(LogOutEvent(authenticationLocalDataSource: authenticationLocalDataSource));
          }

          emit(PaginationLoadedState());


        });

      } catch(e){
        emit(PostLoadingErrorState(e.toString()));
      }

    });

    on<IncreasePageCountEvent>((event,emit){
      emit(PostLoadingState());
      currentPage+=1;
      add(PostLoadingPaginationEvent(currentPage, size));
    });



  }
}
