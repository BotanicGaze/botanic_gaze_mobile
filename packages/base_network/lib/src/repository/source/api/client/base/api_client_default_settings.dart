import 'package:base_network/base_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  // required interceptors
  static List<Interceptor> requiredInterceptors(Dio dio) => [
        if (kDebugMode) CustomLogInterceptor(),
        ConnectivityInterceptor(),
        // RetryOnErrorInterceptor(dio),
      ];
}
