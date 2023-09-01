import 'package:base_network/base_network.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  // required interceptors
  static List<Interceptor> requiredInterceptors(Dio dio) {
    final cookieJar = CookieJar();
    return [
      // CookieManager(cookieJar),
      CustomLogInterceptor(),
      ConnectivityInterceptor(),
      RetryOnErrorInterceptor(dio),
    ];
  }
}
