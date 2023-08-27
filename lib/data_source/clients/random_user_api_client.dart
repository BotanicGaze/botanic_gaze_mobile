import 'package:base_network/base_network.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class PlantApiClient extends RestApiClient {
  PlantApiClient()
      : super(
          baseUrl: 'https://fb27-27-78-70-5.ngrok-free.app',
        );
}
