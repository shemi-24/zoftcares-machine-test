
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:zoftcare_machine_test/presentation/route/route_constants.dart';
import 'package:zoftcare_machine_test/presentation/route/routes.dart';
import 'package:zoftcare_machine_test/presentation/screens/authentication/login_bloc/login_bloc.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/bloc/post_bloc.dart';
import 'package:zoftcare_machine_test/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:zoftcare_machine_test/theme.dart';
import 'package:zoftcare_machine_test/utils/initiate_app_utils.dart';

import 'di/di.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MultiBlocProvider(

          providers: [
            BlocProvider<LoginBloc>(create: (context)=>DependencyInjection().sl<LoginBloc>()),
            BlocProvider<SplashBloc>(create: (context)=>DependencyInjection().sl<SplashBloc>()),
            BlocProvider<PostBloc>(create: (context)=>DependencyInjection().sl<PostBloc>()),

          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigationKey,
            title: 'AAA',
            theme: theme(),
            getPages: Routes.getPages(),
            builder: EasyLoading.init(),
            initialRoute: RouteList.splash,
          ),
        );
      },
    );
  }
}


