import 'package:base_bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class AppNavigator {
  const AppNavigator();

  GoRouter get router;

  bool get canPopSelfOrChildren;

  int get currentBottomTab;

  String getCurrentRouteName({bool useRootNavigator = false});

  GlobalKey<NavigatorState> get navigatorKey;

  BuildContext get globalContext => navigatorKey.currentState!.context;

  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  });

  Future<T?> showAppDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  });

  Future<T?> showAppGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transitionBuilder,
    Duration transitionDuration =
        DurationConstants.defaultGeneralDialogTransitionDuration,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    bool useRootNavigator = true,
  });

  Future<T?> showAppModalBottomSheet<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color barrierColor = Colors.black54,
    Color? backgroundColor,
  });

  void showErrorSnackBar(String message, {Duration? duration});

  void showSuccessSnackBar(String message, {Duration? duration});
}
