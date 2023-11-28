import 'dart:io';

import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/clients/plant_api_client.dart';
import 'package:botanic_gaze/models/index.dart';

abstract class AppApiService {
  AppApiService(this.plantApiClient);

  final PlantApiClient plantApiClient;

  Future<DataResponse<String>> getProtected();

  Future<ResultsListResponse<PlantSearchResponse>> getListPlant(
    PlantSearchRequest request,
  );

  Future<ResultsListResponse<PopularPlantModel>> getPopularPlant(int page);

  Future<DataResponse<PlantIdentifyModel>> identifyPlant(File file);

  Future<DataResponse<PlantDetailModel>> getPlantDetail(int id);

  Future<PlantNetDetail> getPlantNetDetail(String plantNetName);

  Future<DataResponse<WeatherResponse>> getWeatherData(double lat, double lng);

  Future<DataResponse<UserLoginResponse>> loginWithSocial(
    AccountLoginType loginType,
    String accessToken,
  );

  Future<DataResponse<UserInfoResponse>> getUserInfo();

  Future<DataResponse<UserInfoResponse>> dailyCheckIn();

  Future<ResultsListResponse<MyPlantModel>> getMyPlant({
    int page = 1,
    int perPage = 20,
  });

  Future<DataResponse<dynamic>> addPlantToGarden({required int plantId});

  Future<DataResponse<UserInfoResponse>> removePlantFromGarden({
    required int plantId,
  });

  Future<DataResponse<PlantReminder>> addReminder({
    required String myPlantId,
    required ReminderType reminderType,
    required DateTime date,
    required RepeatType repeatType,
    bool? isActive,
  });

  Future<DataResponse<PlantReminder>> updateReminder({
    required String reminderId,
    required ReminderType reminderType,
    required DateTime date,
    required RepeatType repeatType,
    bool? isActive,
  });

  Future<DataResponse<PlantReminder>> switchActiveStateReminder({
    required String reminderId,
    required bool isActive,
    required ReminderType reminderType,
    required DateTime date,
    required RepeatType repeatType,
  });

  Future<DataResponse<FeedbackModel>> sendFeedback({
    required String email,
    required String issueText,
    required String title,
    required String appVersion,
  });

  Future<String> getLocationFromLatLng(double lat, double lng);

  Future<ResultsListResponse<PlantJournalModel>> getPlantJournal(
    String myPlantId, {
    int page = 1,
    int perPage = 20,
  });
}
