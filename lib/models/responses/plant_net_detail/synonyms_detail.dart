import 'package:equatable/equatable.dart';

class SynonymsDetail extends Equatable {
  const SynonymsDetail({this.name, this.author});

  factory SynonymsDetail.fromJson(Map<String, dynamic> json) {
    return SynonymsDetail(
      name: json['name'] as String?,
      author: json['author'] as String?,
    );
  }
  final String? name;
  final String? author;

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
      };

  SynonymsDetail copyWith({
    String? name,
    String? author,
  }) {
    return SynonymsDetail(
      name: name ?? this.name,
      author: author ?? this.author,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, author];
}
