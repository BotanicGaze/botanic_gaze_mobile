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
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      totalResult: json['totalResult'] as int? ?? 0,
    );

Map<String, dynamic> _$ResultsListResponseToJson<T>(
  ResultsListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'success': instance.success,
      'message': instance.message,
      'totalResult': instance.totalResult,
    };
