import 'package:shared/shared.dart';

part 'results_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResultsListResponse<T> {
  factory ResultsListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$ResultsListResponseFromJson(json, fromJsonT);

  @JsonKey(defaultValue: [])
  final List<T> results;
  @JsonKey(defaultValue: false)
  final bool? success;
  final String? message;
  @JsonKey(defaultValue: 0)
  final int? totalResult;

  ResultsListResponse({
    required this.results,
    this.success,
    this.message,
    this.totalResult,
  });
}
