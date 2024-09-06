
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zoftcare_machine_test/presentation/route/route_constants.dart';
import 'package:zoftcare_machine_test/presentation/screens/posts/screens/posts_listing_screen.dart';

import '../core/auth_wrapper.dart';
import '../core/login_screen_wrapper.dart';
import '../screens/network_fails/no_internet_screen.dart';
import '../screens/network_fails/server500_screen.dart';
import '../screens/network_fails/server_error.dart';
import '../screens/splash/splash_screen.dart';


class Routes {
  static Map<String, Widget> routes() => {
        RouteList.authWrapper: const AuthWrapper(),
        RouteList.splash: const SplashScreen(),
        RouteList.loginViewWrapper: const LoginViewWrapper(),

        RouteList.noInternetScreen : const NoInternetScreen(),
        RouteList.serverErrorScreen : const ServerErrorScreen(),
        RouteList.serverError500Screen : const Server500ErrorScreen(),
        RouteList.serverError500Screen : const Server500ErrorScreen(),
        RouteList.postsListingScreen : const PostsListingScreen(),





  };

  static List<GetPage> getPages() {
    List<GetPage> pages = [];
    routes().forEach((key, value) {
      pages.add(GetPage(name: key, page: () => value));
    });
    return pages;
  }
}
