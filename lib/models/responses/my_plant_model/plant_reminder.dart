import 'package:botanic_gaze/constants/index.dart';
import 'package:equatable/equatable.dart';

class PlantReminder extends Equatable {
  const PlantReminder({this.id, this.reminderType, this.time, this.repeat});

  factory PlantReminder.fromJson(Map<String, dynamic> json) => PlantReminder(
        id: json['id'] as String?,
        reminderType: ReminderTypeX.dataFromId(json['reminderType'] as String?),
        time: json['time'] as String?,
        repeat: json['repeat'] as String?,
      );
  final String? id;
  final ReminderType? reminderType;
  final String? time;
  final String? repeat;

  Map<String, dynamic> toJson() => {
        'id': id,
        'reminderType': reminderType?.name,
        'time': time,
        'repeat': repeat,
      };

  PlantReminder copyWith({
    String? id,
    ReminderType? reminderType,
    String? time,
    String? repeat,
  }) {
    return PlantReminder(
      id: id ?? this.id,
      reminderType: reminderType ?? this.reminderType,
      time: time ?? this.time,
      repeat: repeat ?? this.repeat,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, reminderType, time, repeat];
}
