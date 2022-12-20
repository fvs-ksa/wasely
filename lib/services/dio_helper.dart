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
      },
    ));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query,String? token,}) async {
    dio.options.headers= {"Authorization":'Bearer $token',};
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
