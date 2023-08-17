// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_initial_app_data_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetInitialAppDataInput {}

/// @nodoc
abstract class $GetInitialAppDataInputCopyWith<$Res> {
  factory $GetInitialAppDataInputCopyWith(GetInitialAppDataInput value,
          $Res Function(GetInitialAppDataInput) then) =
      _$GetInitialAppDataInputCopyWithImpl<$Res, GetInitialAppDataInput>;
}

/// @nodoc
class _$GetInitialAppDataInputCopyWithImpl<$Res,
        $Val extends GetInitialAppDataInput>
    implements $GetInitialAppDataInputCopyWith<$Res> {
  _$GetInitialAppDataInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetInitialAppDataInputCopyWith<$Res> {
  factory _$$_GetInitialAppDataInputCopyWith(_$_GetInitialAppDataInput value,
          $Res Function(_$_GetInitialAppDataInput) then) =
      __$$_GetInitialAppDataInputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetInitialAppDataInputCopyWithImpl<$Res>
    extends _$GetInitialAppDataInputCopyWithImpl<$Res,
        _$_GetInitialAppDataInput>
    implements _$$_GetInitialAppDataInputCopyWith<$Res> {
  __$$_GetInitialAppDataInputCopyWithImpl(_$_GetInitialAppDataInput _value,
      $Res Function(_$_GetInitialAppDataInput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetInitialAppDataInput implements _GetInitialAppDataInput {
  const _$_GetInitialAppDataInput();

  @override
  String toString() {
    return 'GetInitialAppDataInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetInitialAppDataInput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _GetInitialAppDataInput implements GetInitialAppDataInput {
  const factory _GetInitialAppDataInput() = _$_GetInitialAppDataInput;
}

/// @nodoc
mixin _$GetInitialAppDataOutput {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;
  LanguageCode get languageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetInitialAppDataOutputCopyWith<GetInitialAppDataOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetInitialAppDataOutputCopyWith<$Res> {
  factory $GetInitialAppDataOutputCopyWith(GetInitialAppDataOutput value,
          $Res Function(GetInitialAppDataOutput) then) =
      _$GetInitialAppDataOutputCopyWithImpl<$Res, GetInitialAppDataOutput>;
  @useResult
  $Res call({bool isLoggedIn, bool isDarkMode, LanguageCode languageCode});
}

/// @nodoc
class _$GetInitialAppDataOutputCopyWithImpl<$Res,
        $Val extends GetInitialAppDataOutput>
    implements $GetInitialAppDataOutputCopyWith<$Res> {
  _$GetInitialAppDataOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isDarkMode = null,
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetInitialAppDataOutputCopyWith<$Res>
    implements $GetInitialAppDataOutputCopyWith<$Res> {
  factory _$$_GetInitialAppDataOutputCopyWith(_$_GetInitialAppDataOutput value,
          $Res Function(_$_GetInitialAppDataOutput) then) =
      __$$_GetInitialAppDataOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn, bool isDarkMode, LanguageCode languageCode});
}

/// @nodoc
class __$$_GetInitialAppDataOutputCopyWithImpl<$Res>
    extends _$GetInitialAppDataOutputCopyWithImpl<$Res,
        _$_GetInitialAppDataOutput>
    implements _$$_GetInitialAppDataOutputCopyWith<$Res> {
  __$$_GetInitialAppDataOutputCopyWithImpl(_$_GetInitialAppDataOutput _value,
      $Res Function(_$_GetInitialAppDataOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? isDarkMode = null,
    Object? languageCode = null,
  }) {
    return _then(_$_GetInitialAppDataOutput(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode,
    ));
  }
}

/// @nodoc

class _$_GetInitialAppDataOutput extends _GetInitialAppDataOutput {
  const _$_GetInitialAppDataOutput(
      {this.isLoggedIn = false,
      this.isDarkMode = false,
      this.languageCode = LanguageCode.ja})
      : super._();

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool isDarkMode;
  @override
  @JsonKey()
  final LanguageCode languageCode;

  @override
  String toString() {
    return 'GetInitialAppDataOutput(isLoggedIn: $isLoggedIn, isDarkMode: $isDarkMode, languageCode: $languageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetInitialAppDataOutput &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoggedIn, isDarkMode, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetInitialAppDataOutputCopyWith<_$_GetInitialAppDataOutput>
      get copyWith =>
          __$$_GetInitialAppDataOutputCopyWithImpl<_$_GetInitialAppDataOutput>(
              this, _$identity);
}

abstract class _GetInitialAppDataOutput extends GetInitialAppDataOutput {
  const factory _GetInitialAppDataOutput(
      {final bool isLoggedIn,
      final bool isDarkMode,
      final LanguageCode languageCode}) = _$_GetInitialAppDataOutput;
  const _GetInitialAppDataOutput._() : super._();

  @override
  bool get isLoggedIn;
  @override
  bool get isDarkMode;
  @override
  LanguageCode get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_GetInitialAppDataOutputCopyWith<_$_GetInitialAppDataOutput>
      get copyWith => throw _privateConstructorUsedError;
}
