part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginCheckingEvent extends LoginEvent{

  final String email;
  final String password;

  LoginCheckingEvent({required this.password,required this.email});
}

class LogOutEvent extends LoginEvent{

  final AuthenticationLocalDataSource authenticationLocalDataSource;

  LogOutEvent({required this.authenticationLocalDataSource});


}



class PasswordObsecureEvent extends LoginEvent {}


class DeleteUserEvent extends LoginEvent {}

