import 'package:dio/dio.dart';
import 'package:wasely/services/base_url.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: BaseUrl.baseUrl,
      receiveDataWhenStatusError: true,
      // headers: {
      //   'Authorization':"$token",
      //   'Content-type': 'application/json',
      //
      //   //'zoneId':zone_ids,
      //
      // },
    ));
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query,String? token}) async {

    dio.options.headers= {
      "Authorization":'Bearer $token'??"",
      'Content-Type': 'application/json'
     // "zoneId":zone
    };
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
