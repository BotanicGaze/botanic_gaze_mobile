import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:equatable/equatable.dart';

part 'plant_journal_event.dart';
part 'plant_journal_state.dart';

class PlantJournalBloc extends BaseBloc<PlantJournalEvent, PlantJournalState> {
  PlantJournalBloc() : super(PlantJournalState()) {
    on<PlantJournalEvent>((event, emit) {});
  }
}
