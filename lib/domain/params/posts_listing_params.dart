import 'package:equatable/equatable.dart';

class PostListingParams extends Equatable {
  final int page;
  final int size;


  const PostListingParams(
      {required this.page,
        required this.size,
      });

  Map<String, dynamic> toMap() {
    return {

      "page":page,
      "size":size,
    };
  }


  @override
  List<Object?> get props => [page,size];
}
