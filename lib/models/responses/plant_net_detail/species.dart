import 'package:equatable/equatable.dart';

class Species extends Equatable {
  const Species({this.name, this.author});

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'] as String?,
        author: json['author'] as String?,
      );
  final String? name;
  final String? author;

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
      };

  Species copyWith({
    String? name,
    String? author,
  }) {
    return Species(
      name: name ?? this.name,
      author: author ?? this.author,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, author];
}
