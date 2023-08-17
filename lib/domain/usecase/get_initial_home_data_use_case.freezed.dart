// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_initial_home_data_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetInitialHomeDataInput {}

/// @nodoc
abstract class $GetInitialHomeDataInputCopyWith<$Res> {
  factory $GetInitialHomeDataInputCopyWith(GetInitialHomeDataInput value,
          $Res Function(GetInitialHomeDataInput) then) =
      _$GetInitialHomeDataInputCopyWithImpl<$Res, GetInitialHomeDataInput>;
}

/// @nodoc
class _$GetInitialHomeDataInputCopyWithImpl<$Res,
        $Val extends GetInitialHomeDataInput>
    implements $GetInitialHomeDataInputCopyWith<$Res> {
  _$GetInitialHomeDataInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetInitialHomeDataInputCopyWith<$Res> {
  factory _$$_GetInitialHomeDataInputCopyWith(_$_GetInitialHomeDataInput value,
          $Res Function(_$_GetInitialHomeDataInput) then) =
      __$$_GetInitialHomeDataInputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetInitialHomeDataInputCopyWithImpl<$Res>
    extends _$GetInitialHomeDataInputCopyWithImpl<$Res,
        _$_GetInitialHomeDataInput>
    implements _$$_GetInitialHomeDataInputCopyWith<$Res> {
  __$$_GetInitialHomeDataInputCopyWithImpl(_$_GetInitialHomeDataInput _value,
      $Res Function(_$_GetInitialHomeDataInput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetInitialHomeDataInput implements _GetInitialHomeDataInput {
  const _$_GetInitialHomeDataInput();

  @override
  String toString() {
    return 'GetInitialHomeDataInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetInitialHomeDataInput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GetInitialHomeDataInput implements GetInitialHomeDataInput {
  const factory _GetInitialHomeDataInput() = _$_GetInitialHomeDataInput;
}

/// @nodoc
mixin _$GetInitialHomeDataOutput {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get isFirstLaunchApp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetInitialHomeDataOutputCopyWith<GetInitialHomeDataOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetInitialHomeDataOutputCopyWith<$Res> {
  factory $GetInitialHomeDataOutputCopyWith(GetInitialHomeDataOutput value,
          $Res Function(GetInitialHomeDataOutput) then) =
      _$GetInitialHomeDataOutputCopyWithImpl<$Res, GetInitialHomeDataOutput>;
  @useResult
  $Res call({bool isLoggedIn, bool isFirstLaunchApp});
}

/// @nodoc
class _$GetInitialHomeDataOutputCopyWithImpl<$Res,
        $Val extends GetInitialHomeDataOutput>
    implements $GetInitialHomeDataOutputCopyWith<$Res> {
  _$GetInitialHomeDataOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isFirstLaunchApp = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLaunchApp: null == isFirstLaunchApp
          ? _value.isFirstLaunchApp
          : isFirstLaunchApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetInitialHomeDataOutputCopyWith<$Res>
    implements $GetInitialHomeDataOutputCopyWith<$Res> {
  factory _$$_GetInitialHomeDataOutputCopyWith(
          _$_GetInitialHomeDataOutput value,
          $Res Function(_$_GetInitialHomeDataOutput) then) =
      __$$_GetInitialHomeDataOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn, bool isFirstLaunchApp});
}

/// @nodoc
class __$$_GetInitialHomeDataOutputCopyWithImpl<$Res>
    extends _$GetInitialHomeDataOutputCopyWithImpl<$Res,
        _$_GetInitialHomeDataOutput>
    implements _$$_GetInitialHomeDataOutputCopyWith<$Res> {
  __$$_GetInitialHomeDataOutputCopyWithImpl(_$_GetInitialHomeDataOutput _value,
      $Res Function(_$_GetInitialHomeDataOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isFirstLaunchApp = null,
  }) {
    return _then(_$_GetInitialHomeDataOutput(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstLaunchApp: null == isFirstLaunchApp
          ? _value.isFirstLaunchApp
          : isFirstLaunchApp // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetInitialHomeDataOutput extends _GetInitialHomeDataOutput {
  const _$_GetInitialHomeDataOutput(
      {this.isLoggedIn = false, this.isFirstLaunchApp = true})
      : super._();

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool isFirstLaunchApp;

  @override
  String toString() {
    return 'GetInitialHomeDataOutput(isLoggedIn: $isLoggedIn, isFirstLaunchApp: $isFirstLaunchApp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetInitialHomeDataOutput &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isFirstLaunchApp, isFirstLaunchApp) ||
                other.isFirstLaunchApp == isFirstLaunchApp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn, isFirstLaunchApp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetInitialHomeDataOutputCopyWith<_$_GetInitialHomeDataOutput>
      get copyWith => __$$_GetInitialHomeDataOutputCopyWithImpl<
          _$_GetInitialHomeDataOutput>(this, _$identity);
}

abstract class _GetInitialHomeDataOutput extends GetInitialHomeDataOutput {
  const factory _GetInitialHomeDataOutput(
      {final bool isLoggedIn,
      final bool isFirstLaunchApp}) = _$_GetInitialHomeDataOutput;
  const _GetInitialHomeDataOutput._() : super._();

  @override
  bool get isLoggedIn;
  @override
  bool get isFirstLaunchApp;
  @override
  @JsonKey(ignore: true)
  _$$_GetInitialHomeDataOutputCopyWith<_$_GetInitialHomeDataOutput>
      get copyWith => throw _privateConstructorUsedError;
}
