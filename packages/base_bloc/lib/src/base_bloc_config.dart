import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'di/di.dart' as di;

class BaseBlocConfig extends Config {
  BaseBlocConfig._();

  factory BaseBlocConfig.getInstance() {
    return _instance;
  }

  static final BaseBlocConfig _instance = BaseBlocConfig._();

  static BaseBlocConfig get instance => _instance;

  VoidCallback? _onForceLogoutButtonPressed;

  VoidCallback? get onForceLogoutButtonPressed => _onForceLogoutButtonPressed;

  @override
  Future<void> config({ConfigArgument? configArgument}) async {
    di.configureInjection();
  }
}

class BaseBlocConfigArgument implements ConfigArgument {
  final VoidCallback? onForceLogoutButtonPressed;

  BaseBlocConfigArgument({
    this.onForceLogoutButtonPressed,
  });
}
