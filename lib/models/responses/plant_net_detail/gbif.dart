import 'package:equatable/equatable.dart';

class Gbif extends Equatable {
  const Gbif({this.id});

  factory Gbif.fromJson(Map<String, dynamic> json) => Gbif(
        id: json['id'] as String?,
      );
  final String? id;

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  Gbif copyWith({
    String? id,
  }) {
    return Gbif(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
