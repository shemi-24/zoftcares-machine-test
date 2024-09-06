import 'package:equatable/equatable.dart';

class PostModelEntity extends Equatable {

  final int? id;
  final String? title;
  final String? body;
  final String? image;


  const PostModelEntity({this.id, this.title, this.body, this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body];

}