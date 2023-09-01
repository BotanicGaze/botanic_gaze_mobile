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
  final List<PlantTypes> plantTypesSelected;

  @override
  List<Object?> get props => [
        sunlightSelected,
        seasonOfInterestSelected,
        soilTypeSelected,
        plantTypesSelected
      ];

  SearchPlantsFilterState copyWith({
    List<Sunlight>? sunlightSelected,
    List<SoilType>? soilTypeSelected,
    List<SeasonOfInterest>? seasonOfInterestSelected,
    List<PlantTypes>? plantTypesSelected,
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
  final List<PlantTypes> plantTypesSelected;

  bool get hasFilter =>
      sunlightSelected.isNotEmpty ||
      soilTypeSelected.isNotEmpty ||
      seasonOfInterestSelected.isNotEmpty ||
      plantTypesSelected.isNotEmpty;
}
