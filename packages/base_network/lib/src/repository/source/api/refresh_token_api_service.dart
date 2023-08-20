import 'package:base_network/src/repository/model/base_data/data_response.dart';

abstract class RefreshTokenApiService<T> {
  Future<DataResponse<T>> refreshToken(String refreshToken);
}
