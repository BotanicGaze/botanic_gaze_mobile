// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_language_code_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaveLanguageCodeInput {
  LanguageCode get languageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveLanguageCodeInputCopyWith<SaveLanguageCodeInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveLanguageCodeInputCopyWith<$Res> {
  factory $SaveLanguageCodeInputCopyWith(SaveLanguageCodeInput value,
          $Res Function(SaveLanguageCodeInput) then) =
      _$SaveLanguageCodeInputCopyWithImpl<$Res, SaveLanguageCodeInput>;
  @useResult
  $Res call({LanguageCode languageCode});
}

/// @nodoc
class _$SaveLanguageCodeInputCopyWithImpl<$Res,
        $Val extends SaveLanguageCodeInput>
    implements $SaveLanguageCodeInputCopyWith<$Res> {
  _$SaveLanguageCodeInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaveLanguageCodeUseCaseCopyWith<$Res>
    implements $SaveLanguageCodeInputCopyWith<$Res> {
  factory _$$_SaveLanguageCodeUseCaseCopyWith(_$_SaveLanguageCodeUseCase value,
          $Res Function(_$_SaveLanguageCodeUseCase) then) =
      __$$_SaveLanguageCodeUseCaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LanguageCode languageCode});
}

/// @nodoc
class __$$_SaveLanguageCodeUseCaseCopyWithImpl<$Res>
    extends _$SaveLanguageCodeInputCopyWithImpl<$Res,
        _$_SaveLanguageCodeUseCase>
    implements _$$_SaveLanguageCodeUseCaseCopyWith<$Res> {
  __$$_SaveLanguageCodeUseCaseCopyWithImpl(_$_SaveLanguageCodeUseCase _value,
      $Res Function(_$_SaveLanguageCodeUseCase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
  }) {
    return _then(_$_SaveLanguageCodeUseCase(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode,
    ));
  }
}

/// @nodoc

class _$_SaveLanguageCodeUseCase implements _SaveLanguageCodeUseCase {
  const _$_SaveLanguageCodeUseCase({required this.languageCode});

  @override
  final LanguageCode languageCode;

  @override
  String toString() {
    return 'SaveLanguageCodeInput(languageCode: $languageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveLanguageCodeUseCase &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveLanguageCodeUseCaseCopyWith<_$_SaveLanguageCodeUseCase>
      get copyWith =>
          __$$_SaveLanguageCodeUseCaseCopyWithImpl<_$_SaveLanguageCodeUseCase>(
              this, _$identity);
}

abstract class _SaveLanguageCodeUseCase implements SaveLanguageCodeInput {
  const factory _SaveLanguageCodeUseCase(
      {required final LanguageCode languageCode}) = _$_SaveLanguageCodeUseCase;

  @override
  LanguageCode get languageCode;
  @override
  @JsonKey(ignore: true)
  _$$_SaveLanguageCodeUseCaseCopyWith<_$_SaveLanguageCodeUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SaveLanguageCodeOutput {}

/// @nodoc
abstract class $SaveLanguageCodeOutputCopyWith<$Res> {
  factory $SaveLanguageCodeOutputCopyWith(SaveLanguageCodeOutput value,
          $Res Function(SaveLanguageCodeOutput) then) =
      _$SaveLanguageCodeOutputCopyWithImpl<$Res, SaveLanguageCodeOutput>;
}

/// @nodoc
class _$SaveLanguageCodeOutputCopyWithImpl<$Res,
        $Val extends SaveLanguageCodeOutput>
    implements $SaveLanguageCodeOutputCopyWith<$Res> {
  _$SaveLanguageCodeOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SaveLanguageCodeOutputCopyWith<$Res> {
  factory _$$_SaveLanguageCodeOutputCopyWith(_$_SaveLanguageCodeOutput value,
          $Res Function(_$_SaveLanguageCodeOutput) then) =
      __$$_SaveLanguageCodeOutputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveLanguageCodeOutputCopyWithImpl<$Res>
    extends _$SaveLanguageCodeOutputCopyWithImpl<$Res,
        _$_SaveLanguageCodeOutput>
    implements _$$_SaveLanguageCodeOutputCopyWith<$Res> {
  __$$_SaveLanguageCodeOutputCopyWithImpl(_$_SaveLanguageCodeOutput _value,
      $Res Function(_$_SaveLanguageCodeOutput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveLanguageCodeOutput extends _SaveLanguageCodeOutput {
  const _$_SaveLanguageCodeOutput() : super._();

  @override
  String toString() {
    return 'SaveLanguageCodeOutput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveLanguageCodeOutput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SaveLanguageCodeOutput extends SaveLanguageCodeOutput {
  const factory _SaveLanguageCodeOutput() = _$_SaveLanguageCodeOutput;
  const _SaveLanguageCodeOutput._() : super._();
}
