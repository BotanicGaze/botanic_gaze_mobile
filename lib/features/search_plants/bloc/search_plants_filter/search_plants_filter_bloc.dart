import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:shared/shared.dart';

part 'search_plants_filter_event.dart';
part 'search_plants_filter_state.dart';

@Injectable()
class SearchPlantsFilterBloc
    extends BaseBloc<SearchPlantsFilterEvent, SearchPlantsFilterState> {
  SearchPlantsFilterBloc() : super(const SearchPlantsFilterState()) {
    on<InitSelectedData>(_onInitSelectedData);
    on<SelectedSunlight>(_onSelectedSunlight);
    on<SelectedSoilType>(_onSelectedSoilType);
    on<SelectedSeasonOfInterest>(_onSelectedSeasonOfInterest);
    on<SelectedPlantingType>(_onSelectedPlantingType);
    on<ResetAllFilter>(_onResetAllFilter);
  }

  void _onSelectedSunlight(
    SelectedSunlight event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    if (event.clearAll) {
      emit(state.copyWith(sunlightSelected: []));
      return;
    }
    if (event.data == null) return;
    final data = List<Sunlight>.from(state.sunlightSelected);
    if (data.any((e) => e.id == event.data?.id)) {
      data.removeWhere((e) => e.id == event.data?.id);
    } else {
      data.add(event.data!);
    }
    emit(state.copyWith(sunlightSelected: data));
  }

  void _onSelectedSoilType(
    SelectedSoilType event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    if (event.clearAll) {
      emit(state.copyWith(soilTypeSelected: []));
      return;
    }
    if (event.data == null) return;
    final data = List<SoilType>.from(state.soilTypeSelected);
    if (data.any((e) => e.id == event.data?.id)) {
      data.removeWhere((e) => e.id == event.data?.id);
    } else {
      data.add(event.data!);
    }
    emit(state.copyWith(soilTypeSelected: data));
  }

  void _onSelectedSeasonOfInterest(
    SelectedSeasonOfInterest event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    if (event.clearAll) {
      emit(state.copyWith(seasonOfInterestSelected: []));
      return;
    }
    if (event.data == null) return;
    final data = List<SeasonOfInterest>.from(state.seasonOfInterestSelected);
    if (data.any((e) => e.id == event.data?.id)) {
      data.removeWhere((e) => e.id == event.data?.id);
    } else {
      data.add(event.data!);
    }
    emit(state.copyWith(seasonOfInterestSelected: data));
  }

  void _onSelectedPlantingType(
    SelectedPlantingType event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    if (event.clearAll) {
      emit(state.copyWith(plantTypesSelected: []));
      return;
    }
    if (event.data == null) return;
    final data = List<PlantTypes>.from(state.plantTypesSelected);
    if (data.any((e) => e.id == event.data?.id)) {
      data.removeWhere((e) => e.id == event.data?.id);
    } else {
      data.add(event.data!);
    }
    emit(state.copyWith(plantTypesSelected: data));
  }

  void _onResetAllFilter(
    ResetAllFilter event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    emit(
      state.copyWith(
        sunlightSelected: [],
        soilTypeSelected: [],
        seasonOfInterestSelected: [],
        plantTypesSelected: [],
      ),
    );
  }

  void _onInitSelectedData(
    InitSelectedData event,
    Emitter<SearchPlantsFilterState> emit,
  ) {
    emit(
      state.copyWith(
        sunlightSelected: event.data.sunlightSelected,
        soilTypeSelected: event.data.soilTypeSelected,
        seasonOfInterestSelected: event.data.seasonOfInterestSelected,
        plantTypesSelected: event.data.plantTypesSelected,
      ),
    );
  }
}
