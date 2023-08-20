// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultsListResponse<T> _$ResultsListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResultsListResponse<T>(
      results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ResultsListResponseToJson<T>(
  ResultsListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results?.map(toJsonT).toList(),
    };
