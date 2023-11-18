part of 'my_plant_detail_bloc.dart';

class MyPlantDetailState extends BaseBlocState with EquatableMixin {
  const MyPlantDetailState({this.myPlant});

  final MyPlantModel? myPlant;

  bool reminderIsActive(ReminderType type) {
    return myPlant?.reminder
            ?.firstOrNullWhere((element) => element.reminderType == type)
            ?.isActive ??
        false;
  }

  bool reminderAlreadyExist(ReminderType type) {
    return myPlant?.reminder?.any((element) => element.reminderType == type) ??
        false;
  }

  PlantReminder? plantReminder(ReminderType type) => myPlant?.reminder
      ?.firstOrNullWhere((element) => element.reminderType == type);

  @override
  List<Object?> get props => [myPlant];

  MyPlantDetailState copyWith({
    MyPlantModel? myPlant,
  }) {
    return MyPlantDetailState(
      myPlant: myPlant ?? this.myPlant,
    );
  }
}
