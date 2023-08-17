// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_login_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FakeLoginInput {}

/// @nodoc
abstract class $FakeLoginInputCopyWith<$Res> {
  factory $FakeLoginInputCopyWith(
          FakeLoginInput value, $Res Function(FakeLoginInput) then) =
      _$FakeLoginInputCopyWithImpl<$Res, FakeLoginInput>;
}

/// @nodoc
class _$FakeLoginInputCopyWithImpl<$Res, $Val extends FakeLoginInput>
    implements $FakeLoginInputCopyWith<$Res> {
  _$FakeLoginInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FakeLoginInputCopyWith<$Res> {
  factory _$$_FakeLoginInputCopyWith(
          _$_FakeLoginInput value, $Res Function(_$_FakeLoginInput) then) =
      __$$_FakeLoginInputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FakeLoginInputCopyWithImpl<$Res>
    extends _$FakeLoginInputCopyWithImpl<$Res, _$_FakeLoginInput>
    implements _$$_FakeLoginInputCopyWith<$Res> {
  __$$_FakeLoginInputCopyWithImpl(
      _$_FakeLoginInput _value, $Res Function(_$_FakeLoginInput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FakeLoginInput implements _FakeLoginInput {
  const _$_FakeLoginInput();

  @override
  String toString() {
    return 'FakeLoginInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FakeLoginInput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _FakeLoginInput implements FakeLoginInput {
  const factory _FakeLoginInput() = _$_FakeLoginInput;
}

/// @nodoc
mixin _$FakeLoginOutput {
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FakeLoginOutputCopyWith<FakeLoginOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FakeLoginOutputCopyWith<$Res> {
  factory $FakeLoginOutputCopyWith(
          FakeLoginOutput value, $Res Function(FakeLoginOutput) then) =
      _$FakeLoginOutputCopyWithImpl<$Res, FakeLoginOutput>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$FakeLoginOutputCopyWithImpl<$Res, $Val extends FakeLoginOutput>
    implements $FakeLoginOutputCopyWith<$Res> {
  _$FakeLoginOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FakeLoginOutputCopyWith<$Res>
    implements $FakeLoginOutputCopyWith<$Res> {
  factory _$$_FakeLoginOutputCopyWith(
          _$_FakeLoginOutput value, $Res Function(_$_FakeLoginOutput) then) =
      __$$_FakeLoginOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$_FakeLoginOutputCopyWithImpl<$Res>
    extends _$FakeLoginOutputCopyWithImpl<$Res, _$_FakeLoginOutput>
    implements _$$_FakeLoginOutputCopyWith<$Res> {
  __$$_FakeLoginOutputCopyWithImpl(
      _$_FakeLoginOutput _value, $Res Function(_$_FakeLoginOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_FakeLoginOutput(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FakeLoginOutput extends _FakeLoginOutput {
  const _$_FakeLoginOutput({this.status = ''}) : super._();

  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'FakeLoginOutput(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FakeLoginOutput &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FakeLoginOutputCopyWith<_$_FakeLoginOutput> get copyWith =>
      __$$_FakeLoginOutputCopyWithImpl<_$_FakeLoginOutput>(this, _$identity);
}

abstract class _FakeLoginOutput extends FakeLoginOutput {
  const factory _FakeLoginOutput({final String status}) = _$_FakeLoginOutput;
  const _FakeLoginOutput._() : super._();

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_FakeLoginOutputCopyWith<_$_FakeLoginOutput> get copyWith =>
      throw _privateConstructorUsedError;
}
