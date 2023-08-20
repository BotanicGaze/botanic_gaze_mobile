import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio(
    String baseUrl, {
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        connectTimeout:
            options?.connectTimeout ?? ServerTimeoutConstants.connectTimeout,
        receiveTimeout:
            options?.receiveTimeout ?? ServerTimeoutConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ServerTimeoutConstants.sendTimeout,
        baseUrl: baseUrl,
      ),
    );
  }
}
