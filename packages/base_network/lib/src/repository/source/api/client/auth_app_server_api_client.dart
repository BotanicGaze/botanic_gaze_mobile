import 'package:shared/shared.dart';

import '../middleware/access_token_interceptor.dart';
import '../middleware/header_interceptor.dart';
import '../middleware/refresh_token_interceptor.dart';
import 'base/rest_api_client.dart';

@LazySingleton()
class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    String baseUrl,
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
    RefreshTokenInterceptor refreshTokenInterceptor,
  ) : super(baseUrl: baseUrl, interceptors: [
          headerInterceptor,
          accessTokenInterceptor,
          refreshTokenInterceptor,
        ]);
}
