import 'package:botanic_gaze/models/responses/popular_plant_model/popular_recommend/content.dart';
import 'package:equatable/equatable.dart';

class PopularRecommend extends Equatable {
  const PopularRecommend({this.content, this.type});

  factory PopularRecommend.fromJson(Map<String, dynamic> json) {
    return PopularRecommend(
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );
  }
  final Content? content;
  final String? type;

  Map<String, dynamic> toJson() => {
        'content': content?.toJson(),
        'type': type,
      };

  PopularRecommend copyWith({
    Content? content,
    String? type,
  }) {
    return PopularRecommend(
      content: content ?? this.content,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [content, type];
}
