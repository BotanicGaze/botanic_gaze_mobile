part of 'search_plants_filter_bloc.dart';

sealed class SearchPlantsFilterEvent extends BaseBlocEvent
    with EquatableMixin {}

class InitSelectedData extends SearchPlantsFilterEvent {
  InitSelectedData(this.data);

  final SearchPlantsFilter data;
  @override
  List<Object?> get props => [data];
}

class SelectedSunlight extends SearchPlantsFilterEvent {
  SelectedSunlight({
    this.data,
    this.clearAll = false,
  });

  final Sunlight? data;
  final bool clearAll;

  @override
  List<Object?> get props => [data, clearAll];
}

class SelectedSoilType extends SearchPlantsFilterEvent {
  SelectedSoilType({
    this.data,
    this.clearAll = false,
  });

  final SoilType? data;
  final bool clearAll;

  @override
  List<Object?> get props => [data, clearAll];
}

class SelectedSeasonOfInterest extends SearchPlantsFilterEvent {
  SelectedSeasonOfInterest({
    this.data,
    this.clearAll = false,
  });

  final SeasonOfInterest? data;
  final bool clearAll;

  @override
  List<Object?> get props => [data, clearAll];
}

class SelectedPlantingType extends SearchPlantsFilterEvent {
  SelectedPlantingType({
    this.data,
    this.clearAll = false,
  });

  final PlantType? data;
  final bool clearAll;

  @override
  List<Object?> get props => [data, clearAll];
}

class ResetAllFilter extends SearchPlantsFilterEvent {
  @override
  List<Object?> get props => [];
}
