part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class PostLoadingEvent extends PostEvent{
  final int page,size;

  PostLoadingEvent(this.page, this.size);
}

class PostLoadingPaginationEvent extends PostEvent{
  final int page,size;

  PostLoadingPaginationEvent(this.page, this.size);
}

class IncreasePageCountEvent extends PostEvent {}
