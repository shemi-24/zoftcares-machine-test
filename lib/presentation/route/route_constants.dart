
import 'package:zoftcare_machine_test/presentation/core/login_screen_wrapper.dart';
import 'package:zoftcare_machine_test/presentation/screens/network_fails/no_internet_screen.dart';
import 'package:zoftcare_machine_test/presentation/screens/network_fails/server500_screen.dart';
import 'package:zoftcare_machine_test/presentation/screens/network_fails/server_error.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/screens/posts_listing_screen.dart';

import '../screens/splash/splash_screen.dart';

class RouteList{
  RouteList._();

  static const String authWrapper = "/auth_wrapper";
  static String splash=SplashScreen.routeName;
  static String loginViewWrapper=LoginViewWrapper.routeName;
  static String noInternetScreen=NoInternetScreen.routeName;
  static String serverErrorScreen=ServerErrorScreen.routeName;
  static String serverError500Screen=Server500ErrorScreen.routeName;
  static String postsListingScreen=PostsListingScreen.routeName;


}