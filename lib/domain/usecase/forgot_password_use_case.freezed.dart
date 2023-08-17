// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordInput {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordInputCopyWith<ForgotPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordInputCopyWith<$Res> {
  factory $ForgotPasswordInputCopyWith(
          ForgotPasswordInput value, $Res Function(ForgotPasswordInput) then) =
      _$ForgotPasswordInputCopyWithImpl<$Res, ForgotPasswordInput>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordInputCopyWithImpl<$Res, $Val extends ForgotPasswordInput>
    implements $ForgotPasswordInputCopyWith<$Res> {
  _$ForgotPasswordInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordInputCopyWith<$Res>
    implements $ForgotPasswordInputCopyWith<$Res> {
  factory _$$_ForgotPasswordInputCopyWith(_$_ForgotPasswordInput value,
          $Res Function(_$_ForgotPasswordInput) then) =
      __$$_ForgotPasswordInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_ForgotPasswordInputCopyWithImpl<$Res>
    extends _$ForgotPasswordInputCopyWithImpl<$Res, _$_ForgotPasswordInput>
    implements _$$_ForgotPasswordInputCopyWith<$Res> {
  __$$_ForgotPasswordInputCopyWithImpl(_$_ForgotPasswordInput _value,
      $Res Function(_$_ForgotPasswordInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ForgotPasswordInput(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordInput implements _ForgotPasswordInput {
  const _$_ForgotPasswordInput({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordInput(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordInput &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordInputCopyWith<_$_ForgotPasswordInput> get copyWith =>
      __$$_ForgotPasswordInputCopyWithImpl<_$_ForgotPasswordInput>(
          this, _$identity);
}

abstract class _ForgotPasswordInput implements ForgotPasswordInput {
  const factory _ForgotPasswordInput({required final String email}) =
      _$_ForgotPasswordInput;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordInputCopyWith<_$_ForgotPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordOutput {}

/// @nodoc
abstract class $ForgotPasswordOutputCopyWith<$Res> {
  factory $ForgotPasswordOutputCopyWith(ForgotPasswordOutput value,
          $Res Function(ForgotPasswordOutput) then) =
      _$ForgotPasswordOutputCopyWithImpl<$Res, ForgotPasswordOutput>;
}

/// @nodoc
class _$ForgotPasswordOutputCopyWithImpl<$Res,
        $Val extends ForgotPasswordOutput>
    implements $ForgotPasswordOutputCopyWith<$Res> {
  _$ForgotPasswordOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ForgotPasswordOutputCopyWith<$Res> {
  factory _$$_ForgotPasswordOutputCopyWith(_$_ForgotPasswordOutput value,
          $Res Function(_$_ForgotPasswordOutput) then) =
      __$$_ForgotPasswordOutputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ForgotPasswordOutputCopyWithImpl<$Res>
    extends _$ForgotPasswordOutputCopyWithImpl<$Res, _$_ForgotPasswordOutput>
    implements _$$_ForgotPasswordOutputCopyWith<$Res> {
  __$$_ForgotPasswordOutputCopyWithImpl(_$_ForgotPasswordOutput _value,
      $Res Function(_$_ForgotPasswordOutput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ForgotPasswordOutput extends _ForgotPasswordOutput {
  const _$_ForgotPasswordOutput() : super._();

  @override
  String toString() {
    return 'ForgotPasswordOutput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ForgotPasswordOutput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ForgotPasswordOutput extends ForgotPasswordOutput {
  const factory _ForgotPasswordOutput() = _$_ForgotPasswordOutput;
  const _ForgotPasswordOutput._() : super._();
}
