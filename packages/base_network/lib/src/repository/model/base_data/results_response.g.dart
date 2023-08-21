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
<<<<<<< HEAD
      results: (json['hits'] as List<dynamic>?)?.map(fromJsonT).toList(),
=======
      results:
          (json['results'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      totalResult: json['totalResult'] as int? ?? 0,
>>>>>>> 1f3d265b9ec9b6236d95f654db1ced0c602d84e1
    );

Map<String, dynamic> _$ResultsListResponseToJson<T>(
  ResultsListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'success': instance.success,
      'message': instance.message,
      'totalResult': instance.totalResult,
    };
