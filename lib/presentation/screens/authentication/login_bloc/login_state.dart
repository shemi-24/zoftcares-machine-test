part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}




class AuthLoading extends LoginState{}

class Authenticated extends LoginState{


  Authenticated();
}


class UnAuthenticated extends LoginState{}


class AuthenticatedError extends LoginState{


  final String message;

  AuthenticatedError({required this.message});

}




class ForgotPasswordRequestLoading extends LoginState{}


class ForgotPasswordRequestErrorState extends LoginState{


  final String message;

  ForgotPasswordRequestErrorState({required this.message});

}

class ForgotPasswordSuccessState extends LoginState{


  final String message;

  ForgotPasswordSuccessState({required this.message});

}


class LoadingState extends LoginState {}


class LoadedState extends LoginState {}


