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
  Widget? _buildPageLoading;

  VoidCallback? get onForceLogoutButtonPressed => _onForceLogoutButtonPressed;
  Widget? get buildPageLoading => _buildPageLoading;

  @override
  Future<void> config({ConfigArgument? configArgument}) async {
    var config = configArgument as BaseBlocConfigArgument?;
    _buildPageLoading = config?.buildPageLoading;
    di.configureInjection();
  }
}

class BaseBlocConfigArgument implements ConfigArgument {
  final VoidCallback? onForceLogoutButtonPressed;
  final Widget? buildPageLoading;

  BaseBlocConfigArgument({
    this.onForceLogoutButtonPressed,
    this.buildPageLoading,
  });
}
