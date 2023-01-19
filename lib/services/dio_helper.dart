import 'package:dio/dio.dart';
import 'package:wasely/services/base_url.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: BaseUrl.baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-type': 'application/json',
        'Authorization':token,
        'zoneId':zone_ids,

      },
    ));
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query,String? token,var zone}) async {
    dio.options.headers= {"Authorization":'Bearer $token',"zoneId":zone};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
        String? token,
      required Map<String, dynamic> data}) async {
    dio.options.headers= {"Authorization":'Bearer $token',};


    return await dio.post(url, queryParameters: query, data: data,);
  }
}
