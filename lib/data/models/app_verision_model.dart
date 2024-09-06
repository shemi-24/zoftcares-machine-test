import 'package:zoftcare_machine_test/domain/entities/app_version_model_entity.dart';

class AppVersionModel {
  AppVersionModel({
    required this.status,
    required this.data,
  });

  final bool? status;
  final Data? data;

  factory AppVersionModel.fromJson(Map<String, dynamic> json){
    return AppVersionModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };

}

class Data extends AppVersionModelEntity{
  const Data({
    required super.version,
  });


  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      version: json["version"],
    );
  }

  Map<String, dynamic> toJson() => {
    "version": version,
  };

}
