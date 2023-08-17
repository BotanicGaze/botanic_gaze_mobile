// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_initial_resource_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadInitialResourceInput {}

/// @nodoc
abstract class $LoadInitialResourceInputCopyWith<$Res> {
  factory $LoadInitialResourceInputCopyWith(LoadInitialResourceInput value,
          $Res Function(LoadInitialResourceInput) then) =
      _$LoadInitialResourceInputCopyWithImpl<$Res, LoadInitialResourceInput>;
}

/// @nodoc
class _$LoadInitialResourceInputCopyWithImpl<$Res,
        $Val extends LoadInitialResourceInput>
    implements $LoadInitialResourceInputCopyWith<$Res> {
  _$LoadInitialResourceInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadInitialResourceInputCopyWith<$Res> {
  factory _$$_LoadInitialResourceInputCopyWith(
          _$_LoadInitialResourceInput value,
          $Res Function(_$_LoadInitialResourceInput) then) =
      __$$_LoadInitialResourceInputCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadInitialResourceInputCopyWithImpl<$Res>
    extends _$LoadInitialResourceInputCopyWithImpl<$Res,
        _$_LoadInitialResourceInput>
    implements _$$_LoadInitialResourceInputCopyWith<$Res> {
  __$$_LoadInitialResourceInputCopyWithImpl(_$_LoadInitialResourceInput _value,
      $Res Function(_$_LoadInitialResourceInput) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInitialResourceInput implements _LoadInitialResourceInput {
  const _$_LoadInitialResourceInput();

  @override
  String toString() {
    return 'LoadInitialResourceInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInitialResourceInput);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _LoadInitialResourceInput implements LoadInitialResourceInput {
  const factory _LoadInitialResourceInput() = _$_LoadInitialResourceInput;
}

/// @nodoc
mixin _$LoadInitialResourceOutput {
  List<AppRoute> get initialRoutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadInitialResourceOutputCopyWith<LoadInitialResourceOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadInitialResourceOutputCopyWith<$Res> {
  factory $LoadInitialResourceOutputCopyWith(LoadInitialResourceOutput value,
          $Res Function(LoadInitialResourceOutput) then) =
      _$LoadInitialResourceOutputCopyWithImpl<$Res, LoadInitialResourceOutput>;
  @useResult
  $Res call({List<AppRoute> initialRoutes});
}

/// @nodoc
class _$LoadInitialResourceOutputCopyWithImpl<$Res,
        $Val extends LoadInitialResourceOutput>
    implements $LoadInitialResourceOutputCopyWith<$Res> {
  _$LoadInitialResourceOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoutes = null,
  }) {
    return _then(_value.copyWith(
      initialRoutes: null == initialRoutes
          ? _value.initialRoutes
          : initialRoutes // ignore: cast_nullable_to_non_nullable
              as List<AppRoute>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadInitialResourceOutputCopyWith<$Res>
    implements $LoadInitialResourceOutputCopyWith<$Res> {
  factory _$$_LoadInitialResourceOutputCopyWith(
          _$_LoadInitialResourceOutput value,
          $Res Function(_$_LoadInitialResourceOutput) then) =
      __$$_LoadInitialResourceOutputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppRoute> initialRoutes});
}

/// @nodoc
class __$$_LoadInitialResourceOutputCopyWithImpl<$Res>
    extends _$LoadInitialResourceOutputCopyWithImpl<$Res,
        _$_LoadInitialResourceOutput>
    implements _$$_LoadInitialResourceOutputCopyWith<$Res> {
  __$$_LoadInitialResourceOutputCopyWithImpl(
      _$_LoadInitialResourceOutput _value,
      $Res Function(_$_LoadInitialResourceOutput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoutes = null,
  }) {
    return _then(_$_LoadInitialResourceOutput(
      initialRoutes: null == initialRoutes
          ? _value._initialRoutes
          : initialRoutes // ignore: cast_nullable_to_non_nullable
              as List<AppRoute>,
    ));
  }
}

/// @nodoc

class _$_LoadInitialResourceOutput extends _LoadInitialResourceOutput {
  const _$_LoadInitialResourceOutput(
      {final List<AppRoute> initialRoutes = const [AppRoute.main]})
      : _initialRoutes = initialRoutes,
        super._();

  final List<AppRoute> _initialRoutes;
  @override
  @JsonKey()
  List<AppRoute> get initialRoutes {
    if (_initialRoutes is EqualUnmodifiableListView) return _initialRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialRoutes);
  }

  @override
  String toString() {
    return 'LoadInitialResourceOutput(initialRoutes: $initialRoutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInitialResourceOutput &&
            const DeepCollectionEquality()
                .equals(other._initialRoutes, _initialRoutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_initialRoutes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInitialResourceOutputCopyWith<_$_LoadInitialResourceOutput>
      get copyWith => __$$_LoadInitialResourceOutputCopyWithImpl<
          _$_LoadInitialResourceOutput>(this, _$identity);
}

abstract class _LoadInitialResourceOutput extends LoadInitialResourceOutput {
  const factory _LoadInitialResourceOutput(
      {final List<AppRoute> initialRoutes}) = _$_LoadInitialResourceOutput;
  const _LoadInitialResourceOutput._() : super._();

  @override
  List<AppRoute> get initialRoutes;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInitialResourceOutputCopyWith<_$_LoadInitialResourceOutput>
      get copyWith => throw _privateConstructorUsedError;
}
