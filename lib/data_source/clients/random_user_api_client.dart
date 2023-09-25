import 'package:base_network/base_network.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class PlantApiClient extends RestApiClient {
  PlantApiClient()
      : super(
          baseUrl: 'https://seal-app-2rlbj.ondigitalocean.app',
        );
}
