import 'package:equatable/equatable.dart';

class Family extends Equatable {
  const Family({this.name, this.author});

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        name: json['name'] as String?,
        author: json['author'] as dynamic,
      );
  final String? name;
  final dynamic author;

  Map<String, dynamic> toJson() => {
        'name': name,
        'author': author,
      };

  Family copyWith({
    String? name,
    dynamic author,
  }) {
    return Family(
      name: name ?? this.name,
      author: author ?? this.author,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, author];
}
