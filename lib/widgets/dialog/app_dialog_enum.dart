import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/material.dart';

enum AppDialogStyle { success, failure }

extension AppDialogStyleX on AppDialogStyle {
  Widget get dialogIcon {
    switch (this) {
      case AppDialogStyle.success:
        return Image.asset(AppIcons.iconCheck);
      case AppDialogStyle.failure:
        return Image.asset(AppIcons.iconError);
    }
  }
}
