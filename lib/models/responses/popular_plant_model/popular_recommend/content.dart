import 'package:botanic_gaze/models/responses/popular_plant_model/popular_recommend/item.dart';
import 'package:equatable/equatable.dart';

class Content extends Equatable {
  const Content({
    this.applyNewStyle,
    this.items,
    this.title,
    this.urlLabel,
    this.url,
    this.text,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        applyNewStyle: json['applyNewStyle'] as bool?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
        urlLabel: json['urlLabel'] as String?,
        url: json['url'] as String?,
        text: json['text'] as String?,
      );
  final bool? applyNewStyle;
  final List<Item>? items;
  final String? title;
  final String? urlLabel;
  final String? url;
  final String? text;

  List<int> get recommendPlantsIds =>
      items?.map((e) => e.id ?? 0).toSet().toList() ?? [];

  Map<String, dynamic> toJson() => {
        'applyNewStyle': applyNewStyle,
        'items': items?.map((e) => e.toJson()).toList(),
        'title': title,
        'urlLabel': urlLabel,
        'url': url,
        'text': text,
      };

  Content copyWith({
    bool? applyNewStyle,
    List<Item>? items,
    String? title,
    String? urlLabel,
    String? url,
    String? text,
  }) {
    return Content(
      applyNewStyle: applyNewStyle ?? this.applyNewStyle,
      items: items ?? this.items,
      title: title ?? this.title,
      urlLabel: urlLabel ?? this.urlLabel,
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      applyNewStyle,
      items,
      title,
      urlLabel,
      url,
      text,
    ];
  }
}
