part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoadingState extends SplashState {}

final class SplashLoadedState extends SplashState {}

final class SplashAPILoadingError extends SplashState {

  final String message;

  SplashAPILoadingError({required this.message});

}

