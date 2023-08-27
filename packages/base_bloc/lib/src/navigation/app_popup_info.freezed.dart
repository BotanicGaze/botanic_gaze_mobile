// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppPopupInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)
        confirmDialog,
    required TResult Function(String message, Func0<void>? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult? Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPopupInfoCopyWith<$Res> {
  factory $AppPopupInfoCopyWith(
          AppPopupInfo value, $Res Function(AppPopupInfo) then) =
      _$AppPopupInfoCopyWithImpl<$Res, AppPopupInfo>;
}

/// @nodoc
class _$AppPopupInfoCopyWithImpl<$Res, $Val extends AppPopupInfo>
    implements $AppPopupInfoCopyWith<$Res> {
  _$AppPopupInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ConfirmDialogCopyWith<$Res> {
  factory _$$_ConfirmDialogCopyWith(
          _$_ConfirmDialog value, $Res Function(_$_ConfirmDialog) then) =
      __$$_ConfirmDialogCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String message,
      VoidCallback? onPositive,
      VoidCallback? onNegative,
      bool showButtonNegative,
      String? positiveTitle,
      String? negativeTitle});
}

/// @nodoc
class __$$_ConfirmDialogCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$_ConfirmDialog>
    implements _$$_ConfirmDialogCopyWith<$Res> {
  __$$_ConfirmDialogCopyWithImpl(
      _$_ConfirmDialog _value, $Res Function(_$_ConfirmDialog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? onPositive = freezed,
    Object? onNegative = freezed,
    Object? showButtonNegative = null,
    Object? positiveTitle = freezed,
    Object? negativeTitle = freezed,
  }) {
    return _then(_$_ConfirmDialog(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      onPositive: freezed == onPositive
          ? _value.onPositive
          : onPositive // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      onNegative: freezed == onNegative
          ? _value.onNegative
          : onNegative // ignore: cast_nullable_to_non_nullable
              as VoidCallback?,
      showButtonNegative: null == showButtonNegative
          ? _value.showButtonNegative
          : showButtonNegative // ignore: cast_nullable_to_non_nullable
              as bool,
      positiveTitle: freezed == positiveTitle
          ? _value.positiveTitle
          : positiveTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      negativeTitle: freezed == negativeTitle
          ? _value.negativeTitle
          : negativeTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ConfirmDialog with DiagnosticableTreeMixin implements _ConfirmDialog {
  const _$_ConfirmDialog(
      {this.title = '',
      this.message = '',
      this.onPositive,
      this.onNegative,
      this.showButtonNegative = false,
      this.positiveTitle,
      this.negativeTitle});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String message;
  @override
  final VoidCallback? onPositive;
  @override
  final VoidCallback? onNegative;
  @override
  @JsonKey()
  final bool showButtonNegative;
  @override
  final String? positiveTitle;
  @override
  final String? negativeTitle;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPopupInfo.confirmDialog(title: $title, message: $message, onPositive: $onPositive, onNegative: $onNegative, showButtonNegative: $showButtonNegative, positiveTitle: $positiveTitle, negativeTitle: $negativeTitle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPopupInfo.confirmDialog'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('onPositive', onPositive))
      ..add(DiagnosticsProperty('onNegative', onNegative))
      ..add(DiagnosticsProperty('showButtonNegative', showButtonNegative))
      ..add(DiagnosticsProperty('positiveTitle', positiveTitle))
      ..add(DiagnosticsProperty('negativeTitle', negativeTitle));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmDialog &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onPositive, onPositive) ||
                other.onPositive == onPositive) &&
            (identical(other.onNegative, onNegative) ||
                other.onNegative == onNegative) &&
            (identical(other.showButtonNegative, showButtonNegative) ||
                other.showButtonNegative == showButtonNegative) &&
            (identical(other.positiveTitle, positiveTitle) ||
                other.positiveTitle == positiveTitle) &&
            (identical(other.negativeTitle, negativeTitle) ||
                other.negativeTitle == negativeTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message, onPositive,
      onNegative, showButtonNegative, positiveTitle, negativeTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfirmDialogCopyWith<_$_ConfirmDialog> get copyWith =>
      __$$_ConfirmDialogCopyWithImpl<_$_ConfirmDialog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)
        confirmDialog,
    required TResult Function(String message, Func0<void>? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
  }) {
    return confirmDialog(title, message, onPositive, onNegative,
        showButtonNegative, positiveTitle, negativeTitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult? Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
  }) {
    return confirmDialog?.call(title, message, onPositive, onNegative,
        showButtonNegative, positiveTitle, negativeTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(title, message, onPositive, onNegative,
          showButtonNegative, positiveTitle, negativeTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
  }) {
    return confirmDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
  }) {
    return confirmDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (confirmDialog != null) {
      return confirmDialog(this);
    }
    return orElse();
  }
}

abstract class _ConfirmDialog implements AppPopupInfo {
  const factory _ConfirmDialog(
      {final String title,
      final String message,
      final VoidCallback? onPositive,
      final VoidCallback? onNegative,
      final bool showButtonNegative,
      final String? positiveTitle,
      final String? negativeTitle}) = _$_ConfirmDialog;

  String get title;
  String get message;
  VoidCallback? get onPositive;
  VoidCallback? get onNegative;
  bool get showButtonNegative;
  String? get positiveTitle;
  String? get negativeTitle;
  @JsonKey(ignore: true)
  _$$_ConfirmDialogCopyWith<_$_ConfirmDialog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorWithRetryDialogCopyWith<$Res> {
  factory _$$_ErrorWithRetryDialogCopyWith(_$_ErrorWithRetryDialog value,
          $Res Function(_$_ErrorWithRetryDialog) then) =
      __$$_ErrorWithRetryDialogCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Func0<void>? onRetryPressed});
}

/// @nodoc
class __$$_ErrorWithRetryDialogCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$_ErrorWithRetryDialog>
    implements _$$_ErrorWithRetryDialogCopyWith<$Res> {
  __$$_ErrorWithRetryDialogCopyWithImpl(_$_ErrorWithRetryDialog _value,
      $Res Function(_$_ErrorWithRetryDialog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? onRetryPressed = freezed,
  }) {
    return _then(_$_ErrorWithRetryDialog(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      onRetryPressed: freezed == onRetryPressed
          ? _value.onRetryPressed
          : onRetryPressed // ignore: cast_nullable_to_non_nullable
              as Func0<void>?,
    ));
  }
}

/// @nodoc

class _$_ErrorWithRetryDialog
    with DiagnosticableTreeMixin
    implements _ErrorWithRetryDialog {
  const _$_ErrorWithRetryDialog({this.message = '', this.onRetryPressed});

  @override
  @JsonKey()
  final String message;
  @override
  final Func0<void>? onRetryPressed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPopupInfo.errorWithRetryDialog(message: $message, onRetryPressed: $onRetryPressed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppPopupInfo.errorWithRetryDialog'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('onRetryPressed', onRetryPressed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorWithRetryDialog &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.onRetryPressed, onRetryPressed) ||
                other.onRetryPressed == onRetryPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, onRetryPressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorWithRetryDialogCopyWith<_$_ErrorWithRetryDialog> get copyWith =>
      __$$_ErrorWithRetryDialogCopyWithImpl<_$_ErrorWithRetryDialog>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)
        confirmDialog,
    required TResult Function(String message, Func0<void>? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
  }) {
    return errorWithRetryDialog(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult? Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
  }) {
    return errorWithRetryDialog?.call(message, onRetryPressed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(message, onRetryPressed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
  }) {
    return errorWithRetryDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
  }) {
    return errorWithRetryDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (errorWithRetryDialog != null) {
      return errorWithRetryDialog(this);
    }
    return orElse();
  }
}

abstract class _ErrorWithRetryDialog implements AppPopupInfo {
  const factory _ErrorWithRetryDialog(
      {final String message,
      final Func0<void>? onRetryPressed}) = _$_ErrorWithRetryDialog;

  String get message;
  Func0<void>? get onRetryPressed;
  @JsonKey(ignore: true)
  _$$_ErrorWithRetryDialogCopyWith<_$_ErrorWithRetryDialog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RequiredLoginDialogCopyWith<$Res> {
  factory _$$_RequiredLoginDialogCopyWith(_$_RequiredLoginDialog value,
          $Res Function(_$_RequiredLoginDialog) then) =
      __$$_RequiredLoginDialogCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RequiredLoginDialogCopyWithImpl<$Res>
    extends _$AppPopupInfoCopyWithImpl<$Res, _$_RequiredLoginDialog>
    implements _$$_RequiredLoginDialogCopyWith<$Res> {
  __$$_RequiredLoginDialogCopyWithImpl(_$_RequiredLoginDialog _value,
      $Res Function(_$_RequiredLoginDialog) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RequiredLoginDialog
    with DiagnosticableTreeMixin
    implements _RequiredLoginDialog {
  const _$_RequiredLoginDialog();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppPopupInfo.requiredLoginDialog()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AppPopupInfo.requiredLoginDialog'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RequiredLoginDialog);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)
        confirmDialog,
    required TResult Function(String message, Func0<void>? onRetryPressed)
        errorWithRetryDialog,
    required TResult Function() requiredLoginDialog,
  }) {
    return requiredLoginDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult? Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult? Function()? requiredLoginDialog,
  }) {
    return requiredLoginDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String title,
            String message,
            VoidCallback? onPositive,
            VoidCallback? onNegative,
            bool showButtonNegative,
            String? positiveTitle,
            String? negativeTitle)?
        confirmDialog,
    TResult Function(String message, Func0<void>? onRetryPressed)?
        errorWithRetryDialog,
    TResult Function()? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (requiredLoginDialog != null) {
      return requiredLoginDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConfirmDialog value) confirmDialog,
    required TResult Function(_ErrorWithRetryDialog value) errorWithRetryDialog,
    required TResult Function(_RequiredLoginDialog value) requiredLoginDialog,
  }) {
    return requiredLoginDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConfirmDialog value)? confirmDialog,
    TResult? Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult? Function(_RequiredLoginDialog value)? requiredLoginDialog,
  }) {
    return requiredLoginDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConfirmDialog value)? confirmDialog,
    TResult Function(_ErrorWithRetryDialog value)? errorWithRetryDialog,
    TResult Function(_RequiredLoginDialog value)? requiredLoginDialog,
    required TResult orElse(),
  }) {
    if (requiredLoginDialog != null) {
      return requiredLoginDialog(this);
    }
    return orElse();
  }
}

abstract class _RequiredLoginDialog implements AppPopupInfo {
  const factory _RequiredLoginDialog() = _$_RequiredLoginDialog;
}
