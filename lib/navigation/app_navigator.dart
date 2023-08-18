import 'package:base_bloc/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  @override
  // TODO: implement canPopSelfOrChildren
  bool get canPopSelfOrChildren => throw UnimplementedError();

  @override
  // TODO: implement currentBottomTab
  int get currentBottomTab => throw UnimplementedError();

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) {
    // TODO: implement getCurrentRouteName
    throw UnimplementedError();
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => throw UnimplementedError();

  @override
  Future<bool> pop<T extends Object?>(
      {T? result, bool useRootNavigator = false,}) {
    // TODO: implement pop
    throw UnimplementedError();
  }

  @override
  Future<T?> showDialog<T extends Object?>(AppPopupInfo appPopupInfo,
      {bool barrierDismissible = true,
      bool useSafeArea = false,
      bool useRootNavigator = true,}) {
    // TODO: implement showDialog
    throw UnimplementedError();
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    // TODO: implement showErrorSnackBar
  }

  @override
  Future<T?> showGeneralDialog<T extends Object?>(AppPopupInfo appPopupInfo,
      {Widget Function(BuildContext p1, Animation<double> p2,
              Animation<double> p3, Widget p4,)?
          transitionBuilder,
      Duration transitionDuration =
          DurationConstants.defaultGeneralDialogTransitionDuration,
      bool barrierDismissible = true,
      Color barrierColor = const Color(0x80000000),
      bool useRootNavigator = true,}) {
    // TODO: implement showGeneralDialog
    throw UnimplementedError();
  }

  @override
  Future<T?> showModalBottomSheet<T extends Object?>(AppPopupInfo appPopupInfo,
      {bool isScrollControlled = false,
      bool useRootNavigator = false,
      bool isDismissible = true,
      bool enableDrag = true,
      Color barrierColor = Colors.black54,
      Color? backgroundColor,}) {
    // TODO: implement showModalBottomSheet
    throw UnimplementedError();
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {
    // TODO: implement showSuccessSnackBar
  }
}
