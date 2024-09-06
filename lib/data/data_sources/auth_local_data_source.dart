import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/user_model_entity.dart';
import '../models/user_model.dart';



abstract class AuthenticationLocalDataSource {
  saveUser(UserModel userEntity);

  deleteUser();
}

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final box = GetStorage();
  @override
  deleteUser() {
    box.remove("user");
  }

  @override
  saveUser(UserModel userModel) {
    box.write("user", jsonEncode(userModel));
  }

}
