import 'package:equatable/equatable.dart';

class Synonym extends Equatable {
  const Synonym({this.id, this.name});

  factory Synonym.fromJson(Map<String, dynamic> json) => Synonym(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );
  final int? id;
  final String? name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  Synonym copyWith({
    int? id,
    String? name,
  }) {
    return Synonym(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
