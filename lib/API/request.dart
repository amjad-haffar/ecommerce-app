import 'package:dio/dio.dart';

import 'apiURL.dart';

class RequestDio {
  static Future<Response> getHttps(String url, var data, String method,
      {String? apiToken}) async {
    BaseOptions options = BaseOptions(
        baseUrl: serverName,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(milliseconds: 80000));
    Dio dio = Dio(options);
    Map<String, String> headers = {
      "Content-type": "application/json",
      // "Accept": "application/json",
      // "Authorization": "Bearer " + apiToken!
    };
    try {
      Response response = await dio.request(
        url,
        data: data,
        options: Options(
          headers: headers, method: method,
          // followRedirects: false,
          //     // will not throw errors
          //     validateStatus: (status) => true,
        ),
      );
      print("getHttps() | response.statusCode");
      print(response.statusCode);
      print(response);
      return response;
    } catch (e, s) {
      print("getHttps() | catch exception");
      print(e);
      print(s);
      rethrow;
    }
  }

  static Future<dynamic> callAPI(
    String url,
    var body,
    String method,
// {
    // String apiToken = '',
    // }
  ) async {
    try {
    
      Response r = await getHttps(
        url,
        method=="GET" ?null:body,
        method,
        // apiToken: apiToken,
      );
      // print(r);
      if (r.data != '') {
        return r.data;
      }
      return List.empty();
    } catch (e, s) {
      print(e);
      print("callAPI() | catch exception");
      print('error is ' + e.toString());
      print('stack is ' + s.toString());
      if (e is DioError) {
        print("DIO error: " + e.response.toString());
        // Get.Snackbar('False', e.response.toString(), duration: Duration(seconds: 3) );
      }
      return List.empty();
    }
  }
}
