import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:shared/shared.dart';

part 'my_plant_detail_event.dart';
part 'my_plant_detail_state.dart';

@Injectable()
class MyPlantDetailBloc
    extends BaseBloc<MyPlantDetailEvent, MyPlantDetailState> {
  MyPlantDetailBloc() : super(const MyPlantDetailState()) {
    on<InitState>(_onInitState);
    on<AddReminder>(_onAddReminder);
  }

  Future<void> _onAddReminder(
    AddReminder event,
    Emitter<MyPlantDetailState> emit,
  ) async {
    // Log.d(event.reminderType);
    if (state.reminderIsActive(event.reminderType)) {
      Log.d(event.reminderType);
    } else {
      final output = await getIt<AppApiService>().addReminder(
        plantId: event.plantId,
        date: event.date,
        reminderType: event.reminderType,
        repeatType: event.repeatType,
      );
    }
  }

  Future<void> _onInitState(
    InitState event,
    Emitter<MyPlantDetailState> emit,
  ) async {
    emit(state.copyWith(myPlant: event.myPlant));
  }
}
