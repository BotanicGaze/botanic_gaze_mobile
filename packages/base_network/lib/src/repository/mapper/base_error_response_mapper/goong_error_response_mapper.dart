import 'package:shared/shared.dart';

import '../../mapper/base/base_error_response_mapper.dart';

@Injectable()
class GoongErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      generalMessage: data?['error']['message'],
    );
  }
}
