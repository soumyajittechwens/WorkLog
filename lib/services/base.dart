import 'package:dio/dio.dart' as dioClient;

class BaseUrl{

  static dioClient.Dio getDio1() {
    dioClient.BaseOptions options = dioClient.BaseOptions();
    options.baseUrl = "http://13.232.87.199:8002/"; /// LIVE
    dioClient.Dio dio = new dioClient.Dio(options);
    return dio;
  }

}