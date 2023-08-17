// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginInput {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginInputCopyWith<LoginInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInputCopyWith<$Res> {
  factory $LoginInputCopyWith(
          LoginInput value, $Res Function(LoginInput) then) =
      _$LoginInputCopyWithImpl<$Res, LoginInput>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginInputCopyWithImpl<$Res, $Val extends LoginInput>
    implements $LoginInputCopyWith<$Res> {
  _$LoginInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginInputCopyWith<$Res>
    implements $LoginInputCopyWith<$Res> {
  factory _$$_LoginInputCopyWith(
          _$_LoginInput value, $Res Function(_$_LoginInput) then) =
      __$$_LoginInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginInputCopyWithImpl<$Res>
    extends _$LoginInputCopyWithImpl<$Res, _$_LoginInput>
    implements _$$_LoginInputCopyWith<$Res> {
  __$$_LoginInputCopyWithImpl(
      _$_LoginInput _value, $Res Function(_$_LoginInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginInput(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginInput implements _LoginInput {
  const _$_LoginInput({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginInput(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInput &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInputCopyWith<_$_LoginInput> get copyWith =>
      __$$_LoginInputCopyWithImpl<_$_LoginInput>(this, _$identity);
}

abstract class _LoginInput implements LoginInput {
  const factory _LoginInput(
      {required final String email,
      required final String password}) = _$_LoginInput;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInputCopyWith<_$_LoginInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginOutput {}

/// @nodoc
abstract class $LoginOutputCopyWith<$Res> {
  factory $LoginOutputCopyWith(
          LoginOutput value, $Res Function(LoginOutput) then) =
      _$LoginOutputCopyWithImpl<$Res, LoginOutput>;
}

/// @nodoc
class _$LoginOutputCopyWithImpl<$Res, $Val extends LoginOutput>
    implements $LoginOutputCopyWith<$Res> {
  _$LoginOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoginOutputCopyWith<$Res> {
  factory _$$_LoginOutputCopyWith(
          _$_LoginOutput value, $Res Function(_$_LoginOutput) then) =
      __$$_LoginOutputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginOutputCopyWithImpl<$Res>
    extends _$LoginOutputCopyWithImpl<$Res, _$_LoginOutput>
    implements _$$_LoginOutputCopyWith<$Res> {
  __$$_LoginOutputCopyWithImpl(
      _$_LoginOutput _value, $Res Function(_$_LoginOutput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoginOutput extends _LoginOutput {
  const _$_LoginOutput() : super._();

  @override
  String toString() {
    return 'LoginOutput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoginOutput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _LoginOutput extends LoginOutput {
  const factory _LoginOutput() = _$_LoginOutput;
  const _LoginOutput._() : super._();
}
