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
    on<SwitchActiveStateReminder>(_onSwitchActiveStateReminder);
  }

  Future<void> _onAddReminder(
    AddReminder event,
    Emitter<MyPlantDetailState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        late DataResponse<PlantReminder> output;
        if (state.reminderAlreadyExist(event.reminderType)) {
          output = await getIt<AppApiService>().updateReminder(
            reminderId: state.plantReminder(event.reminderType)?.id ?? '',
            date: event.date,
            reminderType: event.reminderType,
            repeatType: event.repeatType,
            isActive: true,
          );
        } else {
          output = await getIt<AppApiService>().addReminder(
            myPlantId: state.myPlant?.id ?? '',
            date: event.date,
            reminderType: event.reminderType,
            repeatType: event.repeatType,
            isActive: true,
          );
        }
        final listPlantReminder =
            List<PlantReminder>.from(state.myPlant?.reminder ?? []);
        final indexItem = listPlantReminder
            .indexWhere((element) => output.data?.id == element.id);
        if (indexItem < 0) {
          listPlantReminder.add(output.data!);
        } else {
          listPlantReminder[indexItem] = output.data!;
        }
        emit(
          state.copyWith(
            myPlant: state.myPlant?.copyWith(reminder: listPlantReminder),
          ),
        );
      },
      doOnError: (e) async {
        Log.e(e);
      },
    );
  }

  Future<void> _onInitState(
    InitState event,
    Emitter<MyPlantDetailState> emit,
  ) async {
    emit(state.copyWith(myPlant: event.myPlant));
  }

  Future<void> _onSwitchActiveStateReminder(
    SwitchActiveStateReminder event,
    Emitter<MyPlantDetailState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final reminder = state.myPlant?.reminder
            ?.firstOrNullWhere((element) => element.id == event.reminderId);
        late DataResponse<PlantReminder> output;
        output = await getIt<AppApiService>().switchActiveStateReminder(
          reminderId: event.reminderId,
          isActive: event.isActive,
          repeatType: reminder!.repeat!,
          reminderType: reminder.reminderType!,
          date: reminder.time!,
        );
        final listPlantReminder =
            List<PlantReminder>.from(state.myPlant?.reminder ?? []);
        final indexItem = listPlantReminder
            .indexWhere((element) => output.data?.id == element.id);
        if (indexItem < 0) {
          listPlantReminder.add(output.data!);
        } else {
          listPlantReminder[indexItem] = output.data!;
        }

        emit(
          state.copyWith(
            myPlant: state.myPlant?.copyWith(reminder: listPlantReminder),
          ),
        );
      },
      doOnError: (e) async {
        Log.e(e);
      },
    );
  }
}
