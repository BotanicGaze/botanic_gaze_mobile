import 'dart:io';

import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/clients/random_user_api_client.dart';
import 'package:botanic_gaze/data_source/sp_util.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class AppApiService {
  AppApiService(this.plantApiClient);

  final PlantApiClient plantApiClient;

  static const versionPrefix = '/api/v1';
  static const plantPrefix = '/plant/';

  Future<DataResponse<String>> getProtected() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await plantApiClient.fetch(
        RequestOptions(
          path: '$versionPrefix/protected',
          baseUrl: plantApiClient.baseUrl,
        ),
      );
      final result = DataResponse<String>(
        success: true,
        // ignore: avoid_dynamic_calls
        data: response.data['data'] as String?,
      );

      return result;
    } catch (e) {
      return DataResponse<String>(success: false);
    }
  }

  Future<ResultsListResponse<PlantSearchResponse>> getListPlant(
    PlantSearchRequest request,
  ) {
    return plantApiClient
        .request<ResultsListResponse<PlantSearchResponse>, PlantSearchResponse>(
      method: RestMethod.get,
      path: '$versionPrefix${plantPrefix}list',
      queryParameters: request.toJson(),
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: PlantSearchResponse.fromJson,
    );
  }

  Future<DataResponse<PlantIdentifyModel>> identifyPlant(File file) async {
    return plantApiClient
        .request<DataResponse<PlantIdentifyModel>, PlantIdentifyModel>(
      method: RestMethod.post,
      path: '$versionPrefix${plantPrefix}identify',
      body: FormData.fromMap({
        'language': 'en',
        'latitude': 0,
        'longitude': 0,
        'similarImages': true,
        'image': MultipartFile.fromFileSync(file.path),
      }),
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: PlantIdentifyModel.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey)
      },
    );
  }
}
