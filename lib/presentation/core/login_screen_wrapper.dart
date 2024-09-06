import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../screens/authentication/login_bloc/login_bloc.dart';
import '../screens/authentication/screens/login_screen.dart';

class LoginViewWrapper extends StatelessWidget {
  static const String routeName = '/login';

  const LoginViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => DependencyInjection().sl<LoginBloc>(),
      child:  LoginScreen(),
    );
  }
}