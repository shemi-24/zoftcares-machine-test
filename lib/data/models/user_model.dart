class UserModel {
  UserModel({
    required this.status,
    required this.data,
  });

  final bool? status;
  final Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.user,
    required this.accessToken,
    required this.validity,
  });

  final User? user;
  final String? accessToken;
  final int? validity;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      accessToken: json["accessToken"],
      validity: json["validity"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "accessToken": accessToken,
    "validity": validity,
  };

}

class User {
  User({
    required this.firstName,
    required this.lastName,
  });

  final String? firstName;
  final String? lastName;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };

}
