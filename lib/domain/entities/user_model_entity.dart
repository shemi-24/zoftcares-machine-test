import 'package:equatable/equatable.dart';
import 'package:zoftcare_machine_test/utils/debug_utils.dart';

class UserModelEntity extends Equatable{

  final String? firstName;
  final String? lastName;
  final String? accessToken;
  final num? validity;


   const UserModelEntity({required this.firstName, required this.lastName, required this.accessToken, required this.validity});

  factory UserModelEntity.fromJson(Map<String, dynamic> json){

    consoleLog(json);
    consoleLog("FACTORY");

    return UserModelEntity(
      firstName: json["data"]["user"]["firstName"],
      lastName: json["data"]["user"]["firstName"],
      accessToken: json["data"]["accessToken"],
      validity: json["data"]["validity"],
    );
  }

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "accessToken": accessToken,
    "validity": validity,
  };
  @override
  // TODO: implement props
  List<Object?> get props => [accessToken,validity];

}