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

  const factory AppPopupInfo.errorWithRetryDialog({
    @Default('') String message,
    Func0<void>? onRetryPressed,
  }) = _ErrorWithRetryDialog;

  const factory AppPopupInfo.requiredLoginDialog() = _RequiredLoginDialog;
}
