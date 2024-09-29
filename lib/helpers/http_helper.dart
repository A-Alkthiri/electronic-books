import 'package:dio/dio.dart';

class HttpHelper {
  static HttpHelper? httpHelper;
  HttpHelper._();
  static HttpHelper get instance {
    httpHelper ??= HttpHelper._();
    return httpHelper!;
  }

  Dio d = Dio();
  Future<Response> getRequest({required String url}) async {
    return await d.get(url);
  }

  Future<Response> postRequest(
      {required String url, required dynamic data, Options? options}) async {
    return await d.post(url, data: data, options: options);
  }
}
