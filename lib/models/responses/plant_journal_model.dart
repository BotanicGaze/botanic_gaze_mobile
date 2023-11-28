import 'package:equatable/equatable.dart';

class PlantJournalModel extends Equatable {
  const PlantJournalModel({this.id, this.reminderType, this.time});

  factory PlantJournalModel.fromJson(Map<String, dynamic> json) {
    return PlantJournalModel(
      id: json['id'] as String?,
      reminderType: json['reminderType'] as String?,
      time: json['time'] as String?,
    );
  }
  final String? id;
  final String? reminderType;
  final String? time;

  Map<String, dynamic> toJson() => {
        'id': id,
        'reminderType': reminderType,
        'time': time,
      };

  PlantJournalModel copyWith({
    String? id,
    String? reminderType,
    String? time,
  }) {
    return PlantJournalModel(
      id: id ?? this.id,
      reminderType: reminderType ?? this.reminderType,
      time: time ?? this.time,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, reminderType, time];
}
