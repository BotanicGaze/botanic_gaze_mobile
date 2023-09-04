import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:shared/shared.dart';

part 'plant_detail_event.dart';
part 'plant_detail_state.dart';

@Injectable()
class PlantDetailBloc extends BaseBloc<PlantDetailEvent, PlantDetailState> {
  PlantDetailBloc() : super(const PlantDetailState()) {
    on<GetPlantDetail>(_onGetPlantDetail);
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
        print(e);
      },
    );
  }
}
