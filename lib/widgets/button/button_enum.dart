import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

enum FowButtonSize { fullSize, large, medium, normal, small, xSmall, xxSmall }

extension FowButtonSizeEx on FowButtonSize {
  Size get size {
    switch (this) {
      case FowButtonSize.fullSize:
        return Size(double.infinity, Dimens.d48.responsive());
      case FowButtonSize.large:
        return Size(Dimens.d374.responsive(), Dimens.d48.responsive());
      case FowButtonSize.medium:
        return Size(Dimens.d310.responsive(), Dimens.d48.responsive());
      case FowButtonSize.normal:
        return Size(Dimens.d179.responsive(), Dimens.d48.responsive());
      case FowButtonSize.small:
        return Size(Dimens.d140.responsive(), Dimens.d44.responsive());
      case FowButtonSize.xSmall:
        return Size(Dimens.d120.responsive(), Dimens.d36.responsive());
      case FowButtonSize.xxSmall:
    }
    return Size(Dimens.d90.responsive(), Dimens.d34.responsive());
  }

  double get fontSize {
    switch (this) {
      case FowButtonSize.small:
      case FowButtonSize.xSmall:
        return 14.sp;
      case FowButtonSize.xxSmall:
        return 12.sp;
      case FowButtonSize.fullSize:
      case FowButtonSize.large:
      case FowButtonSize.medium:
      case FowButtonSize.normal:
    }
    return 16.sp;
  }
}
