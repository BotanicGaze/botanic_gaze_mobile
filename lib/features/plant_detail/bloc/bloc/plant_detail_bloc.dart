import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/services/global_callback.dart';
import 'package:shared/shared.dart';

part 'plant_detail_event.dart';
part 'plant_detail_state.dart';

@Injectable()
class PlantDetailBloc extends BaseBloc<PlantDetailEvent, PlantDetailState> {
  PlantDetailBloc() : super(const PlantDetailState()) {
    on<GetPlantDetail>(_onGetPlantDetail);
    on<AddPlantToGarden>(_onAddPlantToGarden);
    // on<GetPlantNetDetail>(_onGetPlantNetDetail);
  }

  Future<void> _onGetPlantDetail(
    GetPlantDetail event,
    Emitter<PlantDetailState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final output =
            await getIt<AppApiService>().getPlantDetail(event.plantId);
        emit(
          state.copyWith(
            plantDetailModel: output.data,
          ),
        );
      },
      doOnError: (e) async {
        Log.e(e);
      },
    );
  }

  Future<void> _onAddPlantToGarden(
    AddPlantToGarden event,
    Emitter<PlantDetailState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await getIt<AppApiService>().addPlantToGarden(plantId: event.plantId);
        getIt<GlobalCallback>().onAddMyPlantSuccess?.call();
      },
      doOnError: (e) async {
        // Log.e(e);
        emit(state.copyWith(exception: e));
      },
      handleError: false,
    );
  }
}
