import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/user_model_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../../utils/debug_utils.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthenticationRepository{
   final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  // ignore: unused_field
   final AuthenticationLocalDataSource _authenticationLocalDataSource;

   const AuthRepositoryImpl(this._authenticationRemoteDataSource,
       this._authenticationLocalDataSource
       );


  @override
  Future<Either<AppError, Map<String, dynamic>>> login(Map<String, dynamic> params) async{
    // TODO: implement login
    try{
      UserModel? user;
      final response = await _authenticationRemoteDataSource.login(params);

      print("RESULT AFTER LOGIN IN AUTH REPOSITORY IMPLEMENTATION");
      consoleLog(response);


      if(response["status"] == true){
        user=UserModel.fromJson(response);
        consoleLog(user);
        _authenticationLocalDataSource.saveUser(user);
      }


        return Right(response);




    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> getAppVersion() async {
    // TODO: implement getAppVersion
    try{

      final response = await _authenticationRemoteDataSource.getAppVersion();

      consoleLog("RESULT AFTER LOGIN IN AUTH REPOSITORY IMPLEMENTATION");
      consoleLog(response);
      return Right(response);

    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }


}