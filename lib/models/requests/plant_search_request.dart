import 'package:equatable/equatable.dart';

class PlantSearchRequest extends Equatable {
  const PlantSearchRequest({
    this.page = 1,
    this.perPage = 20,
    this.includeAggregation = false,
    this.q,
    this.plantTypes,
  });

  factory PlantSearchRequest.fromJson(Map<String, dynamic> json) {
    return PlantSearchRequest(
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      includeAggregation: json['includeAggregation'] as bool?,
    );
  }
  final int? page;
  final int? perPage;
  final bool? includeAggregation;
  final String? q;
  final int? plantTypes;

  Map<String, dynamic> toJson() {
    final jsonData = {
      'page': page,
      'perPage': perPage,
      'includeAggregation': includeAggregation,
      'q': q,
      'plantTypes': plantTypes,
    };

    jsonData.removeWhere((k, v) => v == null || v.toString().isEmpty);
    return jsonData;
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [page, perPage, includeAggregation];

  PlantSearchRequest copyWith({
    int? page,
    int? perPage,
    bool? includeAggregation,
    String? q,
    int? plantTypes,
  }) {
    return PlantSearchRequest(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      includeAggregation: includeAggregation ?? this.includeAggregation,
      q: q ?? this.q,
      plantTypes: plantTypes ?? this.plantTypes,
    );
  }
}
