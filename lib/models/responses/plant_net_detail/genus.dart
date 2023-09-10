import 'package:equatable/equatable.dart';

class Genus extends Equatable {
  const Genus({this.name, this.author});

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        name: json['name'] as String?,
        author: json['author'] as dynamic,
      );
  final String? name;
  final dynamic author;

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
      };

  Genus copyWith({
    String? name,
    dynamic author,
  }) {
    return Genus(
      name: name ?? this.name,
      author: author ?? this.author,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, author];
}
