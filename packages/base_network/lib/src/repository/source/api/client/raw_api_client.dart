import 'package:shared/shared.dart';

import 'base/rest_api_client.dart';

@LazySingleton()
class RawApiClient extends RestApiClient {
  RawApiClient({required super.baseUrl});
}
