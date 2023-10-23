import 'package:equatable/equatable.dart';

class FeedbackModel extends Equatable {
  const FeedbackModel({
    this.id,
    this.email,
    this.title,
    this.issueText,
    this.appVersion,
    this.plantId,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json['id'] as int?,
        email: json['email'] as String?,
        title: json['title'] as String?,
        issueText: json['issueText'] as String?,
        appVersion: json['appVersion'] as String?,
        plantId: json['plantId'] as int?,
      );
  final int? id;
  final String? email;
  final String? title;
  final String? issueText;
  final String? appVersion;
  final int? plantId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'title': title,
        'issueText': issueText,
        'appVersion': appVersion,
        'plantId': plantId,
      };

  FeedbackModel copyWith({
    int? id,
    String? email,
    String? title,
    String? issueText,
    String? appVersion,
    int? plantId,
  }) {
    return FeedbackModel(
      id: id ?? this.id,
      email: email ?? this.email,
      title: title ?? this.title,
      issueText: issueText ?? this.issueText,
      appVersion: appVersion ?? this.appVersion,
      plantId: plantId ?? this.plantId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      title,
      issueText,
      appVersion,
      plantId,
    ];
  }
}
