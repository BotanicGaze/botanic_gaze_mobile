part of 'search_plants_filter_bloc.dart';

class SearchPlantsFilterState extends BaseBlocState with EquatableMixin {
  const SearchPlantsFilterState({
    this.sunlightSelected = const [],
    this.soilTypeSelected = const [],
    this.seasonOfInterestSelected = const [],
    this.plantTypesSelected = const [],
  });

  final List<Sunlight> sunlightSelected;
  final List<SoilType> soilTypeSelected;
  final List<SeasonOfInterest> seasonOfInterestSelected;
  final List<PlantType> plantTypesSelected;

  @override
  List<Object?> get props => [
        sunlightSelected,
        seasonOfInterestSelected,
        soilTypeSelected,
        plantTypesSelected
      ];

  bool get hasFilter =>
      sunlightSelected.isNotEmpty ||
      soilTypeSelected.isNotEmpty ||
      seasonOfInterestSelected.isNotEmpty ||
      plantTypesSelected.isNotEmpty;

  SearchPlantsFilterState copyWith({
    List<Sunlight>? sunlightSelected,
    List<SoilType>? soilTypeSelected,
    List<SeasonOfInterest>? seasonOfInterestSelected,
    List<PlantType>? plantTypesSelected,
  }) {
    return SearchPlantsFilterState(
      sunlightSelected: sunlightSelected ?? this.sunlightSelected,
      soilTypeSelected: soilTypeSelected ?? this.soilTypeSelected,
      seasonOfInterestSelected:
          seasonOfInterestSelected ?? this.seasonOfInterestSelected,
      plantTypesSelected: plantTypesSelected ?? this.plantTypesSelected,
    );
  }
}

class SearchPlantsFilter {
  const SearchPlantsFilter({
    this.sunlightSelected = const [],
    this.soilTypeSelected = const [],
    this.seasonOfInterestSelected = const [],
    this.plantTypesSelected = const [],
  });

  final List<Sunlight> sunlightSelected;
  final List<SoilType> soilTypeSelected;
  final List<SeasonOfInterest> seasonOfInterestSelected;
  final List<PlantType> plantTypesSelected;

  List<int> get plantTypesId => plantTypesSelected.map((e) => e.id).toList();
  List<int> get sunlightId => sunlightSelected.map((e) => e.id).toList();
  List<int> get soilTypeId => soilTypeSelected.map((e) => e.id).toList();
  List<int> get seasonOfInterestId =>
      seasonOfInterestSelected.map((e) => e.id).toList();

  bool get hasFilter =>
      sunlightSelected.isNotEmpty ||
      soilTypeSelected.isNotEmpty ||
      seasonOfInterestSelected.isNotEmpty ||
      plantTypesSelected.isNotEmpty;
}
