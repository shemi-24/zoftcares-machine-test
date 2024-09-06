import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repository/data_repository.dart';
import '../../utils/debug_utils.dart';
import '../data_sources/common_data_source.dart';

class DataRepositoryImpl extends DataRepository{
  final CommonDataSource _commonDataSource;

  DataRepositoryImpl(this._commonDataSource);



  @override
  Future<Either<AppError, Map<String, dynamic>>> getPosts(Map<String,dynamic> params) async {
    // TODO: implement getProducts
    try{

      final response = await _commonDataSource.getPosts(params);

      print("RESULT AFTER LOGIN IN AUTH REPOSITORY IMPLEMENTATION");
      consoleLog(response);
      // if(response.isNotEmpty){

      if(response["status"]=="error"){
        return Right(response);
      }

      else{


        return Right(response);
      }



    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
    // throw UnimplementedError();
  }



}