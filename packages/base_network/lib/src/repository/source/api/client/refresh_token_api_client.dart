import 'package:shared/shared.dart';

import '../middleware/access_token_interceptor.dart';
import '../middleware/header_interceptor.dart';
import 'base/rest_api_client.dart';

@LazySingleton()
class RefreshTokenApiClient extends RestApiClient {
  RefreshTokenApiClient(
    String baseUrl,
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          baseUrl: baseUrl,
          interceptors: [
            headerInterceptor,
            accessTokenInterceptor,
          ],
        );
}
