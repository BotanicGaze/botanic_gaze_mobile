// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageUrl {
  String get origin => throw _privateConstructorUsedError;
  String get sm => throw _privateConstructorUsedError;
  String get md => throw _privateConstructorUsedError;
  String get lg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageUrlCopyWith<ImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUrlCopyWith<$Res> {
  factory $ImageUrlCopyWith(ImageUrl value, $Res Function(ImageUrl) then) =
      _$ImageUrlCopyWithImpl<$Res, ImageUrl>;
  @useResult
  $Res call({String origin, String sm, String md, String lg});
}

/// @nodoc
class _$ImageUrlCopyWithImpl<$Res, $Val extends ImageUrl>
    implements $ImageUrlCopyWith<$Res> {
  _$ImageUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? sm = null,
    Object? md = null,
    Object? lg = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      sm: null == sm
          ? _value.sm
          : sm // ignore: cast_nullable_to_non_nullable
              as String,
      md: null == md
          ? _value.md
          : md // ignore: cast_nullable_to_non_nullable
              as String,
      lg: null == lg
          ? _value.lg
          : lg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageUrlCopyWith<$Res> implements $ImageUrlCopyWith<$Res> {
  factory _$$_ImageUrlCopyWith(
          _$_ImageUrl value, $Res Function(_$_ImageUrl) then) =
      __$$_ImageUrlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String origin, String sm, String md, String lg});
}

/// @nodoc
class __$$_ImageUrlCopyWithImpl<$Res>
    extends _$ImageUrlCopyWithImpl<$Res, _$_ImageUrl>
    implements _$$_ImageUrlCopyWith<$Res> {
  __$$_ImageUrlCopyWithImpl(
      _$_ImageUrl _value, $Res Function(_$_ImageUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? sm = null,
    Object? md = null,
    Object? lg = null,
  }) {
    return _then(_$_ImageUrl(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      sm: null == sm
          ? _value.sm
          : sm // ignore: cast_nullable_to_non_nullable
              as String,
      md: null == md
          ? _value.md
          : md // ignore: cast_nullable_to_non_nullable
              as String,
      lg: null == lg
          ? _value.lg
          : lg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ImageUrl implements _ImageUrl {
  const _$_ImageUrl(
      {this.origin = '', this.sm = '', this.md = '', this.lg = ''});

  @override
  @JsonKey()
  final String origin;
  @override
  @JsonKey()
  final String sm;
  @override
  @JsonKey()
  final String md;
  @override
  @JsonKey()
  final String lg;

  @override
  String toString() {
    return 'ImageUrl(origin: $origin, sm: $sm, md: $md, lg: $lg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageUrl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.sm, sm) || other.sm == sm) &&
            (identical(other.md, md) || other.md == md) &&
            (identical(other.lg, lg) || other.lg == lg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin, sm, md, lg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageUrlCopyWith<_$_ImageUrl> get copyWith =>
      __$$_ImageUrlCopyWithImpl<_$_ImageUrl>(this, _$identity);
}

abstract class _ImageUrl implements ImageUrl {
  const factory _ImageUrl(
      {final String origin,
      final String sm,
      final String md,
      final String lg}) = _$_ImageUrl;

  @override
  String get origin;
  @override
  String get sm;
  @override
  String get md;
  @override
  String get lg;
  @override
  @JsonKey(ignore: true)
  _$$_ImageUrlCopyWith<_$_ImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}
