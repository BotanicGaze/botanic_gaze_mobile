part of 'explore_bloc.dart';

class ExploreState extends BaseBlocState with EquatableMixin {
  const ExploreState({
    this.weatherResponse,
    this.flowerOfSeason,
    this.popularPlant = const LoadMoreOutput(data: []),
  });

  final WeatherResponse? weatherResponse;
  final List<PlantSearchResponse>? flowerOfSeason;
  final LoadMoreOutput<PopularPlantModel> popularPlant;

  @override
  List<Object?> get props => [weatherResponse, flowerOfSeason, popularPlant];

  ExploreState copyWith({
    WeatherResponse? weatherResponse,
    List<PlantSearchResponse>? flowerOfSeason,
    LoadMoreOutput<PopularPlantModel>? popularPlant,
  }) {
    return ExploreState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      flowerOfSeason: flowerOfSeason ?? this.flowerOfSeason,
      popularPlant: popularPlant ?? this.popularPlant,
    );
  }
}
