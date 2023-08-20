import 'package:base_network/src/app_preferences.dart';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

import 'base_interceptor.dart';

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _appPreferences.accessToken;
    if (token.isNotEmpty) {
      options.headers[ServerRequestResponseConstants.basicAuthorization] =
          '${ServerRequestResponseConstants.bearer} $token';
    }

    handler.next(options);
  }
}
