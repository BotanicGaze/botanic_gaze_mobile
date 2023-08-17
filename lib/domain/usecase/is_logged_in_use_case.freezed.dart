// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_logged_in_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IsLoggedInInput {}

/// @nodoc
abstract class $IsLoggedInInputCopyWith<$Res> {
  factory $IsLoggedInInputCopyWith(
          IsLoggedInInput value, $Res Function(IsLoggedInInput) then) =
      _$IsLoggedInInputCopyWithImpl<$Res, IsLoggedInInput>;
}

/// @nodoc
class _$IsLoggedInInputCopyWithImpl<$Res, $Val extends IsLoggedInInput>
    implements $IsLoggedInInputCopyWith<$Res> {
  _$IsLoggedInInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_IsLoggedInInputCopyWith<$Res> {
  factory _$$_IsLoggedInInputCopyWith(
          _$_IsLoggedInInput value, $Res Function(_$_IsLoggedInInput) then) =
      __$$_IsLoggedInInputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IsLoggedInInputCopyWithImpl<$Res>
    extends _$IsLoggedInInputCopyWithImpl<$Res, _$_IsLoggedInInput>
    implements _$$_IsLoggedInInputCopyWith<$Res> {
  __$$_IsLoggedInInputCopyWithImpl(
      _$_IsLoggedInInput _value, $Res Function(_$_IsLoggedInInput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_IsLoggedInInput implements _IsLoggedInInput {
  const _$_IsLoggedInInput();

  @override
  String toString() {
    return 'IsLoggedInInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_IsLoggedInInput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _IsLoggedInInput implements IsLoggedInInput {
  const factory _IsLoggedInInput() = _$_IsLoggedInInput;
}

/// @nodoc
mixin _$IsLoggedInOutput {
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsLoggedInOutputCopyWith<IsLoggedInOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsLoggedInOutputCopyWith<$Res> {
  factory $IsLoggedInOutputCopyWith(
          IsLoggedInOutput value, $Res Function(IsLoggedInOutput) then) =
      _$IsLoggedInOutputCopyWithImpl<$Res, IsLoggedInOutput>;
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class _$IsLoggedInOutputCopyWithImpl<$Res, $Val extends IsLoggedInOutput>
    implements $IsLoggedInOutputCopyWith<$Res> {
  _$IsLoggedInOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IsLoggedInOutputCopyWith<$Res>
    implements $IsLoggedInOutputCopyWith<$Res> {
  factory _$$_IsLoggedInOutputCopyWith(
          _$_IsLoggedInOutput value, $Res Function(_$_IsLoggedInOutput) then) =
      __$$_IsLoggedInOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$$_IsLoggedInOutputCopyWithImpl<$Res>
    extends _$IsLoggedInOutputCopyWithImpl<$Res, _$_IsLoggedInOutput>
    implements _$$_IsLoggedInOutputCopyWith<$Res> {
  __$$_IsLoggedInOutputCopyWithImpl(
      _$_IsLoggedInOutput _value, $Res Function(_$_IsLoggedInOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
  }) {
    return _then(_$_IsLoggedInOutput(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IsLoggedInOutput extends _IsLoggedInOutput {
  const _$_IsLoggedInOutput({this.isLoggedIn = false}) : super._();

  @override
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'IsLoggedInOutput(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IsLoggedInOutput &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IsLoggedInOutputCopyWith<_$_IsLoggedInOutput> get copyWith =>
      __$$_IsLoggedInOutputCopyWithImpl<_$_IsLoggedInOutput>(this, _$identity);
}

abstract class _IsLoggedInOutput extends IsLoggedInOutput {
  const factory _IsLoggedInOutput({final bool isLoggedIn}) =
      _$_IsLoggedInOutput;
  const _IsLoggedInOutput._() : super._();

  @override
  bool get isLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$_IsLoggedInOutputCopyWith<_$_IsLoggedInOutput> get copyWith =>
      throw _privateConstructorUsedError;
}
