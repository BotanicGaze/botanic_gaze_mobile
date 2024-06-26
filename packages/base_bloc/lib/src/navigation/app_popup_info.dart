import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';

part 'app_popup_info.freezed.dart';

/// dialog, bottomsheet
@freezed
class AppPopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    @Default('') String title,
    @Default('') String message,
    VoidCallback? onPositive,
    VoidCallback? onNegative,
    @Default(false) bool showButtonNegative,
    String? positiveTitle,
    String? negativeTitle,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.infoDialog({
    @Default('') String title,
    @Default('') String message,
    VoidCallback? onButtonPressed,
  }) = _InfoDialog;

  const factory AppPopupInfo.successDialog({
    @Default('') String title,
    @Default('') String message,
    VoidCallback? onButtonPressed,
  }) = _SuccessDialog;

  const factory AppPopupInfo.errorWithRetryDialog({
    @Default('') String message,
    VoidCallback? onRetryPressed,
  }) = _ErrorWithRetryDialog;

  const factory AppPopupInfo.requiredLoginDialog() = _RequiredLoginDialog;
}
