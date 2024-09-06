import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:zoftcare_machine_test/data/data_sources/auth_local_data_source.dart';
import 'package:zoftcare_machine_test/presentation/route/route_constants.dart';




import '../../presentation/screens/authentication/getx/auth_controller.dart';
import '../../util.dart';
import '../../utils/debug_utils.dart';
import '../../utils/navigation_utils.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);
  
  final box = GetStorage();


  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    consoleLog(getPath(path,params: params));
    AuthController authController = Get.find();
    AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();
    authController.getUser();
    final response = await _client.get(
      getPath(path,params: params),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-key': authController.userEntity != null
            ? '${authController.userEntity!.accessToken}'
            : "",
      },
    );
    consoleLog(response.body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else if (response.statusCode == 404 ) {

      NavigationUtils.serverErrorNavigation();

    }
    else if ( response.statusCode == 401) {


      if(authController.userEntity!=null){
        showError(NavigationService.navigationKey.currentContext!, "Session expired, Please login again");
        authenticationLocalDataSource.deleteUser();

        authController.userEntity  = null;

      }

      navService.pushReplacementNamed(RouteList.loginViewWrapper);
      // throw UnauthorizedException();


    }
    else if (response.statusCode == 500) {
      NavigationUtils.server500ErrorNavigation();
    }
    else {
      isNetWorkAvailable().then((val){
        if(!val){
          NavigationUtils.noInternetNavigation();
        }
      });
      throw Exception(response.reasonPhrase);
    }
  }




  dynamic post(String path, Map<dynamic, dynamic> params) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    AuthController authController = Get.find();
    authController.getUser();
    final response = await _client.post(
      getPath(path,params: params),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-key': authController.userEntity != null
            ? '${authController.userEntity!.accessToken}'
            : "",
      },
    );
    consoleLog("GOT IT");
    consoleLog(response);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      return responseJson;

    }
    else if (response.statusCode == 404 || response.statusCode == 403 ) {


      NavigationUtils.serverErrorNavigation();

    }
    else if (response.statusCode == 500) {
      NavigationUtils.server500ErrorNavigation();

    }
    else {
      isNetWorkAvailable().then((val){
        if(!val){
          NavigationUtils.noInternetNavigation();
        }
      });
      throw Exception(response.reasonPhrase);
    }
  }


  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {

    if(params!=null){

      consoleLog("REQUEST PARAMS");
      consoleLog(params);
      consoleLog(params["page"]);
      return Uri.parse('${ApiConstants.baseUrl}$path?page=${params["page"]}&size=${params["size"]}');
    }
    else{
      return Uri.parse('${ApiConstants.baseUrl}$path');

    }
  }
}
