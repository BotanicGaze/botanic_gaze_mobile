part of 'explore_bloc.dart';

class ExploreState extends BaseBlocState with EquatableMixin {
  const ExploreState({
    required this.currentSeason,
    this.weatherResponse,
    this.flowerOfSeason,
    this.popularPlant = const LoadMoreOutput(data: []),
  });

  final WeatherResponse? weatherResponse;
  final List<PlantSearchResponse>? flowerOfSeason;
  final LoadMoreOutput<PopularPlantModel> popularPlant;
  final SeasonOfInterest currentSeason;

  @override
  List<Object?> get props =>
      [weatherResponse, flowerOfSeason, popularPlant, currentSeason];

  ExploreState copyWith({
    WeatherResponse? weatherResponse,
    List<PlantSearchResponse>? flowerOfSeason,
    LoadMoreOutput<PopularPlantModel>? popularPlant,
  }) {
    return ExploreState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      flowerOfSeason: flowerOfSeason ?? this.flowerOfSeason,
      popularPlant: popularPlant ?? this.popularPlant,
      currentSeason: currentSeason,
    );
  }
}
