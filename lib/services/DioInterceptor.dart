import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../Utils/Shared Preference/shared_pref.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    final token=SharedPrefUtils.getToken();
    if (kDebugMode) {
      print("Token==$token");
    }
    if(token!=null&& token.isNotEmpty)
    {
      options.headers['Authorization']= 'Bearer $token';
    }
    options.headers['Content-Type']= 'application/json';
    super.onRequest(options, handler);
  }
}