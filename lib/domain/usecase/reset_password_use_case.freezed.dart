// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordInput {
  String get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordInputCopyWith<ResetPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordInputCopyWith<$Res> {
  factory $ResetPasswordInputCopyWith(
          ResetPasswordInput value, $Res Function(ResetPasswordInput) then) =
      _$ResetPasswordInputCopyWithImpl<$Res, ResetPasswordInput>;
  @useResult
  $Res call(
      {String token, String email, String password, String confirmPassword});
}

/// @nodoc
class _$ResetPasswordInputCopyWithImpl<$Res, $Val extends ResetPasswordInput>
    implements $ResetPasswordInputCopyWith<$Res> {
  _$ResetPasswordInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordInputCopyWith<$Res>
    implements $ResetPasswordInputCopyWith<$Res> {
  factory _$$_ResetPasswordInputCopyWith(_$_ResetPasswordInput value,
          $Res Function(_$_ResetPasswordInput) then) =
      __$$_ResetPasswordInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token, String email, String password, String confirmPassword});
}

/// @nodoc
class __$$_ResetPasswordInputCopyWithImpl<$Res>
    extends _$ResetPasswordInputCopyWithImpl<$Res, _$_ResetPasswordInput>
    implements _$$_ResetPasswordInputCopyWith<$Res> {
  __$$_ResetPasswordInputCopyWithImpl(
      _$_ResetPasswordInput _value, $Res Function(_$_ResetPasswordInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$_ResetPasswordInput(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordInput implements _ResetPasswordInput {
  const _$_ResetPasswordInput(
      {required this.token,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  final String token;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ResetPasswordInput(token: $token, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordInput &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, token, email, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordInputCopyWith<_$_ResetPasswordInput> get copyWith =>
      __$$_ResetPasswordInputCopyWithImpl<_$_ResetPasswordInput>(
          this, _$identity);
}

abstract class _ResetPasswordInput implements ResetPasswordInput {
  const factory _ResetPasswordInput(
      {required final String token,
      required final String email,
      required final String password,
      required final String confirmPassword}) = _$_ResetPasswordInput;

  @override
  String get token;
  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordInputCopyWith<_$_ResetPasswordInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ResetPasswordOutput {}

/// @nodoc
abstract class $ResetPasswordOutputCopyWith<$Res> {
  factory $ResetPasswordOutputCopyWith(
          ResetPasswordOutput value, $Res Function(ResetPasswordOutput) then) =
      _$ResetPasswordOutputCopyWithImpl<$Res, ResetPasswordOutput>;
}

/// @nodoc
class _$ResetPasswordOutputCopyWithImpl<$Res, $Val extends ResetPasswordOutput>
    implements $ResetPasswordOutputCopyWith<$Res> {
  _$ResetPasswordOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ResetPasswordOutputCopyWith<$Res> {
  factory _$$_ResetPasswordOutputCopyWith(_$_ResetPasswordOutput value,
          $Res Function(_$_ResetPasswordOutput) then) =
      __$$_ResetPasswordOutputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetPasswordOutputCopyWithImpl<$Res>
    extends _$ResetPasswordOutputCopyWithImpl<$Res, _$_ResetPasswordOutput>
    implements _$$_ResetPasswordOutputCopyWith<$Res> {
  __$$_ResetPasswordOutputCopyWithImpl(_$_ResetPasswordOutput _value,
      $Res Function(_$_ResetPasswordOutput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetPasswordOutput extends _ResetPasswordOutput {
  const _$_ResetPasswordOutput() : super._();

  @override
  String toString() {
    return 'ResetPasswordOutput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetPasswordOutput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ResetPasswordOutput extends ResetPasswordOutput {
  const factory _ResetPasswordOutput() = _$_ResetPasswordOutput;
  const _ResetPasswordOutput._() : super._();
}
