import 'package:botanic_gaze/constants/index.dart';
import 'package:equatable/equatable.dart';

class ReminderRequest extends Equatable {
  const ReminderRequest({this.reminderType, this.repeat, this.time});

  // factory ReminderRequest.fromJson(Map<String, dynamic> json) {
  //   return ReminderRequest(
  //     reminderType: json['reminderType'] as String?,
  //     repeat: json['repeat'] as String?,
  //     time: json['time'] as String?,
  //   );
  // }
  final ReminderType? reminderType;
  final RepeatType? repeat;
  final String? time;

  Map<String, dynamic> toJson() => {
        'reminderType': reminderType?.name,
        'repeat': repeat?.name,
        'time': time,
      };

  ReminderRequest copyWith({
    ReminderType? reminderType,
    RepeatType? repeat,
    String? time,
  }) {
    return ReminderRequest(
      reminderType: reminderType ?? this.reminderType,
      repeat: repeat ?? this.repeat,
      time: time ?? this.time,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [reminderType, repeat, time];
}
