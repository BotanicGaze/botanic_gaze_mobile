import 'package:botanic_gaze/constants/index.dart';
import 'package:equatable/equatable.dart';

class PlantReminder extends Equatable {
  const PlantReminder({
    this.id,
    this.reminderType,
    this.time,
    this.repeat,
    this.isActive,
  });

  factory PlantReminder.fromJson(Map<String, dynamic> json) => PlantReminder(
        id: json['id'] as String?,
        reminderType: ReminderTypeX.dataFromId(json['reminderType'] as String?),
        time: json['time'] != null
            ? DateTime.parse(json['time'] as String)
            : null,
        repeat: RepeatTypeX.dataFromId(json['repeat'] as String?),
        isActive: json['isActive'] as bool?,
      );

  final String? id;
  final ReminderType? reminderType;
  final DateTime? time;
  final RepeatType? repeat;
  final bool? isActive;

  Map<String, dynamic> toJson() => {
        'id': id,
        'reminderType': reminderType?.name,
        'time': time?.toIso8601String(),
        'repeat': repeat?.name,
        'isActive': isActive,
      };

  PlantReminder copyWith({
    String? id,
    ReminderType? reminderType,
    DateTime? time,
    RepeatType? repeat,
    bool? isActive,
  }) {
    return PlantReminder(
      id: id ?? this.id,
      reminderType: reminderType ?? this.reminderType,
      time: time ?? this.time,
      repeat: repeat ?? this.repeat,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, reminderType, time, repeat, isActive];
}
