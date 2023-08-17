// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppLocation {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppLocationCopyWith<AppLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocationCopyWith<$Res> {
  factory $AppLocationCopyWith(
          AppLocation value, $Res Function(AppLocation) then) =
      _$AppLocationCopyWithImpl<$Res, AppLocation>;
  @useResult
  $Res call({double? lat, double? lng, String name});
}

/// @nodoc
class _$AppLocationCopyWithImpl<$Res, $Val extends AppLocation>
    implements $AppLocationCopyWith<$Res> {
  _$AppLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLocationCopyWith<$Res>
    implements $AppLocationCopyWith<$Res> {
  factory _$$_AppLocationCopyWith(
          _$_AppLocation value, $Res Function(_$_AppLocation) then) =
      __$$_AppLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? lng, String name});
}

/// @nodoc
class __$$_AppLocationCopyWithImpl<$Res>
    extends _$AppLocationCopyWithImpl<$Res, _$_AppLocation>
    implements _$$_AppLocationCopyWith<$Res> {
  __$$_AppLocationCopyWithImpl(
      _$_AppLocation _value, $Res Function(_$_AppLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = null,
  }) {
    return _then(_$_AppLocation(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppLocation extends _AppLocation {
  const _$_AppLocation({this.lat, this.lng, this.name = ''}) : super._();

  @override
  final double? lat;
  @override
  final double? lng;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'AppLocation(lat: $lat, lng: $lng, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLocation &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLocationCopyWith<_$_AppLocation> get copyWith =>
      __$$_AppLocationCopyWithImpl<_$_AppLocation>(this, _$identity);
}

abstract class _AppLocation extends AppLocation {
  const factory _AppLocation(
      {final double? lat,
      final double? lng,
      final String name}) = _$_AppLocation;
  const _AppLocation._() : super._();

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_AppLocationCopyWith<_$_AppLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
