import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/clients/random_user_api_client.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class AppApiService {
  AppApiService(this.plantApiClient);

  final PlantApiClient plantApiClient;

  Future<ResultsListResponse<PlantSearchResponse>> getListPlant(
    PlantSearchRequest request,
  ) {
    return plantApiClient
        .request<ResultsListResponse<PlantSearchResponse>, PlantSearchResponse>(
      method: RestMethod.post,
      path: '/api/v1/plants/search/advanced',
      body: request.toJson(),
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: PlantSearchResponse.fromJson,
    );
  }
}
