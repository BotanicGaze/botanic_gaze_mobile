import 'package:base_network/base_network.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class PlantApiClient extends RestApiClient {
  PlantApiClient()
      : super(
          baseUrl: 'https://lwapp-uks-prod-psearch-01.azurewebsites.net',
        );
}
