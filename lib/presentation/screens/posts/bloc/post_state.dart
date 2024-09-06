part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {}

class PostLoadingErrorState extends PostState {

  final String message;

  PostLoadingErrorState(this.message);
}

class PaginationLoadingState extends PostState {}

class PaginationLoadedState extends PostState {}


