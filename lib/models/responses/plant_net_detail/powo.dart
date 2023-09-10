import 'package:equatable/equatable.dart';

class Powo extends Equatable {
  const Powo({this.id});

  factory Powo.fromJson(Map<String, dynamic> json) => Powo(
        id: json['id'] as String?,
      );
  final String? id;

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  Powo copyWith({
    String? id,
  }) {
    return Powo(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
