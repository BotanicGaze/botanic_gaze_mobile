// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_account_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterAccountInput {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterAccountInputCopyWith<RegisterAccountInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterAccountInputCopyWith<$Res> {
  factory $RegisterAccountInputCopyWith(RegisterAccountInput value,
          $Res Function(RegisterAccountInput) then) =
      _$RegisterAccountInputCopyWithImpl<$Res, RegisterAccountInput>;
  @useResult
  $Res call({String username, String email, String password, Gender gender});
}

/// @nodoc
class _$RegisterAccountInputCopyWithImpl<$Res,
        $Val extends RegisterAccountInput>
    implements $RegisterAccountInputCopyWith<$Res> {
  _$RegisterAccountInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterAccountInputCopyWith<$Res>
    implements $RegisterAccountInputCopyWith<$Res> {
  factory _$$_RegisterAccountInputCopyWith(_$_RegisterAccountInput value,
          $Res Function(_$_RegisterAccountInput) then) =
      __$$_RegisterAccountInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String email, String password, Gender gender});
}

/// @nodoc
class __$$_RegisterAccountInputCopyWithImpl<$Res>
    extends _$RegisterAccountInputCopyWithImpl<$Res, _$_RegisterAccountInput>
    implements _$$_RegisterAccountInputCopyWith<$Res> {
  __$$_RegisterAccountInputCopyWithImpl(_$_RegisterAccountInput _value,
      $Res Function(_$_RegisterAccountInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
  }) {
    return _then(_$_RegisterAccountInput(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc

class _$_RegisterAccountInput implements _RegisterAccountInput {
  const _$_RegisterAccountInput(
      {required this.username,
      required this.email,
      required this.password,
      required this.gender});

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final Gender gender;

  @override
  String toString() {
    return 'RegisterAccountInput(username: $username, email: $email, password: $password, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterAccountInput &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, password, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterAccountInputCopyWith<_$_RegisterAccountInput> get copyWith =>
      __$$_RegisterAccountInputCopyWithImpl<_$_RegisterAccountInput>(
          this, _$identity);
}

abstract class _RegisterAccountInput implements RegisterAccountInput {
  const factory _RegisterAccountInput(
      {required final String username,
      required final String email,
      required final String password,
      required final Gender gender}) = _$_RegisterAccountInput;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  Gender get gender;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterAccountInputCopyWith<_$_RegisterAccountInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterAccountOutput {}

/// @nodoc
abstract class $RegisterAccountOutputCopyWith<$Res> {
  factory $RegisterAccountOutputCopyWith(RegisterAccountOutput value,
          $Res Function(RegisterAccountOutput) then) =
      _$RegisterAccountOutputCopyWithImpl<$Res, RegisterAccountOutput>;
}

/// @nodoc
class _$RegisterAccountOutputCopyWithImpl<$Res,
        $Val extends RegisterAccountOutput>
    implements $RegisterAccountOutputCopyWith<$Res> {
  _$RegisterAccountOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RegisterAccountOutputCopyWith<$Res> {
  factory _$$_RegisterAccountOutputCopyWith(_$_RegisterAccountOutput value,
          $Res Function(_$_RegisterAccountOutput) then) =
      __$$_RegisterAccountOutputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisterAccountOutputCopyWithImpl<$Res>
    extends _$RegisterAccountOutputCopyWithImpl<$Res, _$_RegisterAccountOutput>
    implements _$$_RegisterAccountOutputCopyWith<$Res> {
  __$$_RegisterAccountOutputCopyWithImpl(_$_RegisterAccountOutput _value,
      $Res Function(_$_RegisterAccountOutput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegisterAccountOutput extends _RegisterAccountOutput {
  const _$_RegisterAccountOutput() : super._();

  @override
  String toString() {
    return 'RegisterAccountOutput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RegisterAccountOutput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _RegisterAccountOutput extends RegisterAccountOutput {
  const factory _RegisterAccountOutput() = _$_RegisterAccountOutput;
  const _RegisterAccountOutput._() : super._();
}
