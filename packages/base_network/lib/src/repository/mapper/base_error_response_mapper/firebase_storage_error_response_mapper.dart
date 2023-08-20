import 'package:shared/shared.dart';

import '../../mapper/base/base_error_response_mapper.dart';

@Injectable()
class FirebaseStorageErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      generalServerStatusCode: data?['error']['code'],
      generalMessage: data?['error']['message'],
    );
  }
}
