import 'package:botanic_gaze/models/responses/my_plant_model/plant_info.dart';
import 'package:botanic_gaze/models/responses/my_plant_model/plant_reminder.dart';
import 'package:equatable/equatable.dart';

class MyPlantModel extends Equatable {
  const MyPlantModel({this.id, this.plantInfo, this.reminder});

  factory MyPlantModel.fromJson(Map<String, dynamic> json) => MyPlantModel(
        id: json['id'] as String?,
        plantInfo: json['plantInfo'] == null
            ? null
            : PlantInfo.fromJson(json['plantInfo'] as Map<String, dynamic>),
        reminder: json['reminder'] != null
            ? (json['reminder'] as List<dynamic>?)
                ?.map((e) => PlantReminder.fromJson(e as Map<String, dynamic>))
                .toList()
            : [],
      );

  factory MyPlantModel.clone(MyPlantModel? data) {
    return MyPlantModel(
      id: data?.id,
      plantInfo: data?.plantInfo,
      reminder: data?.reminder,
    );
  }

  final String? id;
  final PlantInfo? plantInfo;
  final List<PlantReminder>? reminder;

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantInfo': plantInfo?.toJson(),
        'reminder': reminder?.map((e) => e.toJson()).toList(),
      };

  MyPlantModel copyWith({
    String? id,
    PlantInfo? plantInfo,
    List<PlantReminder>? reminder,
  }) {
    return MyPlantModel(
      id: id ?? this.id,
      plantInfo: plantInfo ?? this.plantInfo,
      reminder: reminder ?? this.reminder,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, plantInfo, reminder];
}
