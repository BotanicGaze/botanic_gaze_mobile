import 'package:shared/shared.dart';

import '../middleware/header_interceptor.dart';
import 'base/rest_api_client.dart';

@LazySingleton()
class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(
      {required super.baseUrl, required HeaderInterceptor headerInterceptor})
      : super(
          interceptors: [
            headerInterceptor,
          ],
        );
}
