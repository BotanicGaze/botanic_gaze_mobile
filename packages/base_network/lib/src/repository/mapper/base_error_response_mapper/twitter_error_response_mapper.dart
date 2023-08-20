import 'package:shared/shared.dart';

import '../../mapper/base/base_error_response_mapper.dart';

@Injectable()
class TwitterErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      generalMessage:
          // ignore: avoid-dynamic
          ((data?['errors'] as List<dynamic>?)?.firstOrNull
                  as Map<String, dynamic>)['message'] ??
              '',
    );
  }
}
