import 'package:equatable/equatable.dart';

class Condition extends Equatable {
  const Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as num?,
      );
  final String? text;
  final String? icon;
  final num? code;

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };

  Condition copyWith({
    String? text,
    String? icon,
    num? code,
  }) {
    return Condition(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      code: code ?? this.code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, icon, code];
}
