import 'package:base_network/base_network.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  // required interceptors
  static List<Interceptor> requiredInterceptors(Dio dio) {
    final cookieJar = CookieJar();
    return [
      CookieManager(cookieJar),
      if (kDebugMode) CustomLogInterceptor(),
      ConnectivityInterceptor(),
      RetryOnErrorInterceptor(dio),
    ];
  }
}
