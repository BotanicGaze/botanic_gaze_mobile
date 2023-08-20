// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson<T>(
  DataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'meta': instance.meta,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

DataListResponse<T> _$DataListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataListResponse<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataListResponseToJson<T>(
  DataListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
      'meta': instance.meta,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      pageInfo: json['pagy_info'] == null
          ? null
          : PageInfo.fromJson(json['pagy_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'pagy_info': instance.pageInfo,
    };

_$_PageInfo _$$_PageInfoFromJson(Map<String, dynamic> json) => _$_PageInfo(
      next: json['next'] as int?,
    );

Map<String, dynamic> _$$_PageInfoToJson(_$_PageInfo instance) =>
    <String, dynamic>{
      'next': instance.next,
    };
