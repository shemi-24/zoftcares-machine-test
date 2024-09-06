
import '../../utils/debug_utils.dart';
import '../core/api_client.dart';
import '../core/api_constants.dart';



abstract class CommonDataSource {


  Future<Map<String, dynamic>> getPosts(Map<String,dynamic> params);




}

class CommonDataSourceImpl
    implements CommonDataSource {
  final ApiClient _apiClient;
  CommonDataSourceImpl(this._apiClient);




  @override
  Future<Map<String, dynamic>> getPosts(params) async {
    // TODO: implement getProducts
    final response = await _apiClient.get(ApiConstants.posts,params: params);
    consoleLog(response);
    return response;
    // throw UnimplementedError();
  }

}
