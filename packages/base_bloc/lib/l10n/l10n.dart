import 'package:base_bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseBlocLocalization {
  static const LocalizationsDelegate<BaseBlocLocalizations> delegate =
      BaseBlocLocalizations.delegate;

  static BaseBlocLocalizations get current {
    BuildContext globalContext =
        GetIt.instance.get<AppNavigator>().globalContext;
    return Localizations.of<BaseBlocLocalizations>(
        globalContext, BaseBlocLocalizations)!;
  }
}
