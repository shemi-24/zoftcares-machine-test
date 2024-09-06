

import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/api_constants.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);

  Future<Map<String, dynamic>> getAppVersion();


}

class AuthenticationRemoteDataSourceImpl extends AuthenticationRemoteDataSource{

  final ApiClient _apiClient;
  AuthenticationRemoteDataSourceImpl(this._apiClient);




  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async{
    // TODO: implement login
    final response = await _apiClient.post(ApiConstants.login, params);
    consoleLog(response);
    return response;
    // throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAppVersion() async {
    // TODO: implement getAppVersion
    final response = await _apiClient.get(ApiConstants.appVersion);
    consoleLog(response);
    return response;
  }







}