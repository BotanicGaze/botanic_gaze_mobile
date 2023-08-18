// abstract class BotanicGazeRestClient {}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/task.dart';

part 'botanic_gaze_rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class BotanicGazeRestClient {
  factory BotanicGazeRestClient(Dio dio, {String baseUrl}) =
      _BotanicGazeRestClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();
}
