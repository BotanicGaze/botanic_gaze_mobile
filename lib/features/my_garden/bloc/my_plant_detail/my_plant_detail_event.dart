part of 'my_plant_detail_bloc.dart';

sealed class MyPlantDetailEvent extends BaseBlocEvent with EquatableMixin {
  const MyPlantDetailEvent();
}

class InitState extends MyPlantDetailEvent {
  InitState(this.myPlant);

  final MyPlantModel? myPlant;

  @override
  List<Object?> get props => [myPlant];
}

class AddReminder extends MyPlantDetailEvent {
  AddReminder({
    required this.reminderType,
    required this.plantId,
    required this.date,
    required this.repeatType,
  });

  final ReminderType reminderType;
  final int plantId;
  final DateTime date;
  final RepeatType repeatType;

  @override
  List<Object?> get props => [reminderType, plantId, date, repeatType];
}
