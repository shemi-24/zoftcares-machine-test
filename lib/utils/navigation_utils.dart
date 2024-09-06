import 'package:get/get.dart';

import '../presentation/route/route_constants.dart';

class NavigationUtils {
  NavigationUtils._();

  static noInternetNavigation(){
    navigator?.pushReplacementNamed(RouteList.noInternetScreen);
  }

  static serverErrorNavigation(){
    navigator?.pushReplacementNamed(RouteList.serverErrorScreen);
  }

  static server500ErrorNavigation(){
    navigator?.pushReplacementNamed(RouteList.serverError500Screen);
  }
}