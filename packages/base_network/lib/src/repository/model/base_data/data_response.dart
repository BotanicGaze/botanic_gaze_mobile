// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataListResponse<T> {
  DataListResponse({this.data});

  // ignore: avoid-dynamic
  factory DataListResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$DataListResponseFromJson(json, fromJsonT);

  @JsonKey(name: 'data')
  final List<T>? data;
}

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$DataResponseFromJson(json, fromJsonT);

  final T? data;
  @JsonKey(defaultValue: false)
  final bool? success;
  final String? message;

  DataResponse({this.data, this.success, this.message});
}
