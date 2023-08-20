// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'pagy_info')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({@JsonKey(name: 'pagy_info') PageInfo? pageInfo});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
  }) {
    return _then(_value.copyWith(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MetaCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$_MetaCopyWith(_$_Meta value, $Res Function(_$_Meta) then) =
      __$$_MetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pagy_info') PageInfo? pageInfo});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$_MetaCopyWithImpl<$Res> extends _$MetaCopyWithImpl<$Res, _$_Meta>
    implements _$$_MetaCopyWith<$Res> {
  __$$_MetaCopyWithImpl(_$_Meta _value, $Res Function(_$_Meta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
  }) {
    return _then(_$_Meta(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meta implements _Meta {
  _$_Meta({@JsonKey(name: 'pagy_info') this.pageInfo});

  factory _$_Meta.fromJson(Map<String, dynamic> json) => _$$_MetaFromJson(json);

  @override
  @JsonKey(name: 'pagy_info')
  final PageInfo? pageInfo;

  @override
  String toString() {
    return 'Meta(pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meta &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaCopyWith<_$_Meta> get copyWith =>
      __$$_MetaCopyWithImpl<_$_Meta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  factory _Meta({@JsonKey(name: 'pagy_info') final PageInfo? pageInfo}) =
      _$_Meta;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$_Meta.fromJson;

  @override
  @JsonKey(name: 'pagy_info')
  PageInfo? get pageInfo;
  @override
  @JsonKey(ignore: true)
  _$$_MetaCopyWith<_$_Meta> get copyWith => throw _privateConstructorUsedError;
}

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
mixin _$PageInfo {
  @JsonKey(name: 'next')
  int? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res, PageInfo>;
  @useResult
  $Res call({@JsonKey(name: 'next') int? next});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res, $Val extends PageInfo>
    implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageInfoCopyWith<$Res> implements $PageInfoCopyWith<$Res> {
  factory _$$_PageInfoCopyWith(
          _$_PageInfo value, $Res Function(_$_PageInfo) then) =
      __$$_PageInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'next') int? next});
}

/// @nodoc
class __$$_PageInfoCopyWithImpl<$Res>
    extends _$PageInfoCopyWithImpl<$Res, _$_PageInfo>
    implements _$$_PageInfoCopyWith<$Res> {
  __$$_PageInfoCopyWithImpl(
      _$_PageInfo _value, $Res Function(_$_PageInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(_$_PageInfo(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageInfo implements _PageInfo {
  _$_PageInfo({@JsonKey(name: 'next') this.next});

  factory _$_PageInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PageInfoFromJson(json);

  @override
  @JsonKey(name: 'next')
  final int? next;

  @override
  String toString() {
    return 'PageInfo(next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PageInfo &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      __$$_PageInfoCopyWithImpl<_$_PageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageInfoToJson(
      this,
    );
  }
}

abstract class _PageInfo implements PageInfo {
  factory _PageInfo({@JsonKey(name: 'next') final int? next}) = _$_PageInfo;

  factory _PageInfo.fromJson(Map<String, dynamic> json) = _$_PageInfo.fromJson;

  @override
  @JsonKey(name: 'next')
  int? get next;
  @override
  @JsonKey(ignore: true)
  _$$_PageInfoCopyWith<_$_PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
