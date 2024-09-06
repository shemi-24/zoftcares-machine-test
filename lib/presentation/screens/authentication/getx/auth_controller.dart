import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/models/user_model.dart';
import '../../../../domain/entities/user_model_entity.dart';
import '../../../../utils/debug_utils.dart';

class AuthController with ChangeNotifier{

  AuthController(){
    getUser();
    getUserToken();
    // getCurrencyDetails();
  }



  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? value) {
    _user = value;
  }

   final box = GetStorage();


   UserModelEntity? get userEntity => _userEntity;

   UserModelEntity? _userEntity;

  set userEntity(UserModelEntity? value) {
    _userEntity = value;
  }



   getUser() {
     String? jsonUser = box.read("user");
     consoleLog(jsonUser);
     if (jsonUser != null) {
       _userEntity = UserModelEntity.fromJson(jsonDecode(jsonUser));

       consoleLog("USER DEFINED");
     }

     else {
        _userEntity = null;
     }

     notifyListeners();
   }



  getUserToken() {
    String? jsonUser = box.read("userModel");
    if (jsonUser != null) {
      user = UserModel.fromJson(jsonDecode(jsonUser));
      consoleLog(user!.data!.accessToken);
    }
  }

   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: 'login_form_key');

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>(debugLabel: 'signup_form_key');



  bool validate() {
     bool valid = false;
     if (loginFormKey.currentState!.validate()) {
       valid = true;
     }
     return valid;
   }

  bool validateSignUp() {
    bool valid = false;
    if (signUpFormKey.currentState!.validate()) {
      valid = true;
    }
    return valid;
  }
}