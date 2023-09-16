import 'package:botanic_gaze/models/responses/weather_response/current.dart';
import 'package:botanic_gaze/models/responses/weather_response/location.dart';
import 'package:equatable/equatable.dart';

class WeatherResponse extends Equatable {
  const WeatherResponse({this.location, this.current});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
    );
  }
  final Location? location;
  final Current? current;

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };

  WeatherResponse copyWith({
    Location? location,
    Current? current,
  }) {
    return WeatherResponse(
      location: location ?? this.location,
      current: current ?? this.current,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [location, current];
}
