import 'package:equatable/equatable.dart';

class Plus extends Equatable {
  const Plus({this.count});

  factory Plus.fromJson(Map<String, dynamic> json) => Plus(
        count: json['count'] as int?,
      );
  final int? count;

  Map<String, dynamic> toJson() => {
        'count': count,
      };

  Plus copyWith({
    int? count,
  }) {
    return Plus(
      count: count ?? this.count,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [count];
}
