import 'package:equatable/equatable.dart';

class PlantSearchRequest extends Equatable {
  const PlantSearchRequest({
    this.startFrom = 0,
    this.pageSize = 20,
    this.includeAggregation = false,
  });

  factory PlantSearchRequest.fromJson(Map<String, dynamic> json) {
    return PlantSearchRequest(
      startFrom: json['startFrom'] as int?,
      pageSize: json['pageSize'] as int?,
      includeAggregation: json['includeAggregation'] as bool?,
    );
  }
  final int? startFrom;
  final int? pageSize;
  final bool? includeAggregation;

  Map<String, dynamic> toJson() => {
        'startFrom': startFrom,
        'pageSize': pageSize,
        'includeAggregation': includeAggregation,
      };

  PlantSearchRequest copyWith({
    int? startFrom,
    int? pageSize,
    bool? includeAggregation,
  }) {
    return PlantSearchRequest(
      startFrom: startFrom ?? this.startFrom,
      pageSize: pageSize ?? this.pageSize,
      includeAggregation: includeAggregation ?? this.includeAggregation,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [startFrom, pageSize, includeAggregation];
}
