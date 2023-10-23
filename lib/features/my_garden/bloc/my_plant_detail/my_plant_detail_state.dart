part of 'my_plant_detail_bloc.dart';

class MyPlantDetailState extends BaseBlocState with EquatableMixin {
  const MyPlantDetailState({this.myPlant});

  final MyPlantModel? myPlant;

  bool reminderIsActive(ReminderType type) {
    return myPlant?.reminder?.any((element) => element.reminderType == type) ??
        false;
  }

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
