import 'package:zoftcare_machine_test/domain/entities/post_model_entity.dart';

class PostsModel {
  PostsModel({
    required this.status,
    required this.data,
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
    required this.nextPage,
    required this.previousPage,
    required this.hasMore,
  });

  final bool? status;
  final List<Datum> data;
  final num? currentPage;
  final num? pageSize;
  final num? totalItems;
  final num? totalPages;
  final num? nextPage;
  final dynamic previousPage;
  final bool? hasMore;

  factory PostsModel.fromJson(Map<String, dynamic> json){
    return PostsModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      currentPage: json["currentPage"],
      pageSize: json["pageSize"],
      totalItems: json["totalItems"],
      totalPages: json["totalPages"],
      nextPage: json["nextPage"],
      previousPage: json["previousPage"],
      hasMore: json["hasMore"],
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.map((x) => x?.toJson()).toList(),
    "currentPage": currentPage,
    "pageSize": pageSize,
    "totalItems": totalItems,
    "totalPages": totalPages,
    "nextPage": nextPage,
    "previousPage": previousPage,
    "hasMore": hasMore,
  };

}

class Datum extends PostModelEntity{
  const Datum({
    required super.id,
    required super.title,
    required super.body,
    required super.image,
  });



  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "image": image,
  };

}
