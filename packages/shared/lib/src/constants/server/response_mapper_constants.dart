import 'package:shared/src/model/shared_enum.dart';

class ResponseMapperConstants {
  const ResponseMapperConstants._();
  static const defaultErrorResponseMapperType = ErrorResponseMapperType.jsonObject;
  static const defaultSuccessResponseMapperType = SuccessResponseMapperType.dataJsonObject;
}
