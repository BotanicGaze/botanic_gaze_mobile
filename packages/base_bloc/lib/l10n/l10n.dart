import 'package:base_bloc/base_bloc.dart';
import 'package:base_bloc/l10n/generated/base_bloc_localizations.dart';
import 'package:base_bloc/src/di/di.dart';
import 'package:flutter/material.dart';

class BaseBlocLocalization {
  static const LocalizationsDelegate<BaseBlocLocalizations> delegate =
      BaseBlocLocalizations.delegate;

  static BaseBlocLocalizations get current {
    BuildContext globalContext = getIt<AppNavigator>().globalContext;
    return Localizations.of<BaseBlocLocalizations>(
        globalContext, BaseBlocLocalizations)!;
  }
}
