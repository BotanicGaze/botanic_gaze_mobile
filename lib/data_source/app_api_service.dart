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
  static const weatherPrefix = '/weather/';
  static const authPrefix = '/auth/';
  static const userPrefix = '/user/';
  static const myGardenPrefix = '/my-garden/';

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

  Future<ResultsListResponse<PopularPlantModel>> getPopularPlant(int page) {
    return plantApiClient
        .request<ResultsListResponse<PopularPlantModel>, PopularPlantModel>(
      method: RestMethod.get,
      path: '$versionPrefix${plantPrefix}popular',
      queryParameters: {
        'page': page,
        'perPage': 20,
      },
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: PopularPlantModel.fromJson,
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
      contentType: 'multipart/form-data',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: PlantIdentifyModel.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey)
      },
    );
  }

  Future<DataResponse<PlantDetailModel>> getPlantDetail(int id) async {
    return plantApiClient
        .request<DataResponse<PlantDetailModel>, PlantDetailModel>(
      method: RestMethod.get,
      path: '$versionPrefix${plantPrefix}detail/$id',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: PlantDetailModel.fromJson,
      // headers: {
      //   'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey)
      // },
    );
  }

  Future<PlantNetDetail> getPlantNetDetail(
    String plantNetName,
  ) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await plantApiClient.fetch(
        RequestOptions(
          path: '/v1/projects/k-world-flora/species/$plantNetName?lang=en',
          baseUrl: 'https://api.plantnet.org',
          headers: {
            'user-agent':
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
          },
        ),
      );
      final result =
          PlantNetDetail.fromJson(response.data as Map<String, dynamic>);

      return result;
    } catch (e, stackTrace) {
      Log.e(e, stackTrace: stackTrace);
      return const PlantNetDetail();
    }
  }

  Future<DataResponse<WeatherResponse>> getWeatherData(
    double lat,
    double lng,
  ) async {
    return plantApiClient
        .request<DataResponse<WeatherResponse>, WeatherResponse>(
      method: RestMethod.get,
      path: '$versionPrefix${weatherPrefix}detail',
      queryParameters: {'lat': lat, 'lng': lng},
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: WeatherResponse.fromJson,
    );
  }

  Future<DataResponse<UserLoginResponse>> loginWithSocial(
    AccountLoginType loginType,
    String accessToken,
  ) async {
    return plantApiClient
        .request<DataResponse<UserLoginResponse>, UserLoginResponse>(
      method: RestMethod.post,
      path: '$versionPrefix$authPrefix${loginType.apiEndpoint}',
      body: {'access_token': accessToken},
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: UserLoginResponse.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey)
      },
    );
  }

  Future<DataResponse<UserInfoResponse>> getUserInfo() async {
    return plantApiClient
        .request<DataResponse<UserInfoResponse>, UserInfoResponse>(
      method: RestMethod.get,
      path: '$versionPrefix$userPrefix/userInfo',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: UserInfoResponse.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<DataResponse<UserInfoResponse>> dailyCheckIn() async {
    return plantApiClient
        .request<DataResponse<UserInfoResponse>, UserInfoResponse>(
      method: RestMethod.post,
      path: '$versionPrefix$userPrefix/checkIn',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: UserInfoResponse.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<ResultsListResponse<MyPlantModel>> getMyPlant({
    int page = 1,
    int perPage = 20,
  }) async {
    return plantApiClient
        .request<ResultsListResponse<MyPlantModel>, MyPlantModel>(
      method: RestMethod.get,
      path: '$versionPrefix$myGardenPrefix/plants',
      queryParameters: {
        'page': page,
        'perPage': perPage,
      },
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: MyPlantModel.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<DataResponse<dynamic>> addPlantToGarden({
    required int plantId,
  }) async {
    return plantApiClient.request<DataResponse<dynamic>, dynamic>(
      method: RestMethod.post,
      path: '$versionPrefix$myGardenPrefix/plants',
      body: {'plantId': plantId.toString()},
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<DataResponse<UserInfoResponse>> removePlantFromGarden({
    required int plantId,
  }) async {
    return plantApiClient
        .request<DataResponse<UserInfoResponse>, UserInfoResponse>(
      method: RestMethod.delete,
      path: '$versionPrefix$myGardenPrefix/plants/$plantId',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: UserInfoResponse.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<DataResponse<PlantReminder>> addReminder({
    required int plantId,
    required ReminderType reminderType,
    required DateTime date,
    required RepeatType repeatType,
  }) async {
    return plantApiClient.request<DataResponse<PlantReminder>, PlantReminder>(
      method: RestMethod.post,
      path: '$versionPrefix$myGardenPrefix/reminders/$plantId',
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: PlantReminder.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<DataResponse<FeedbackModel>> sendFeedback({
    required String email,
    required String issueText,
    required String title,
    required String appVersion,
  }) async {
    return plantApiClient.request<DataResponse<FeedbackModel>, FeedbackModel>(
      method: RestMethod.post,
      path: '$versionPrefix/feedback/issue',
      body: {
        'appVersion': appVersion,
        'email': email,
        'issueText': issueText,
        'title': title
      },
      successResponseMapperType: SuccessResponseMapperType.dataJsonObject,
      decoder: FeedbackModel.fromJson,
      headers: {
        'x-csrf-token': SpUtil.getString(AppPreferencesKey.xCsrfTokenKey),
        'Authorization':
            SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)
      },
    );
  }

  Future<String> getLocationFromLatLng(
    double lat,
    double lng,
  ) async {
    final response = await plantApiClient.fetch<dynamic>(
      RequestOptions(
        path: '/data/reverse-geocode-client',
        baseUrl: 'https://api.bigdatacloud.net',
        queryParameters: {
          'latitude': lat,
          'longitude': lng,
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data as Map;
      return '${data['locality']}';
    }

    return '';
  }
}
