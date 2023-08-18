import 'package:base_bloc/src/navigation/app_popup_info.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

abstract class AppNavigator {
  const AppNavigator();

  bool get canPopSelfOrChildren;

  int get currentBottomTab;

  String getCurrentRouteName({bool useRootNavigator = false});

  GlobalKey<NavigatorState> get navigatorKey;

  BuildContext get globalContext => navigatorKey.currentState!.context;

  // void popUntilRootOfCurrentBottomTab();

  // void navigateToBottomTab(int index, {bool notify = true});

  // Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo);

  // Future<void> pushAll(List<AppRouteInfo> listAppRouteInfo);

  // Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo);

  // Future<void> replaceAll(List<AppRouteInfo> listAppRouteInfo);

  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  });

  // Future<T?> popAndPush<T extends Object?, R extends Object?>(
  //   AppRouteInfo appRouteInfo, {
  //   R? result,
  //   bool useRootNavigator = false,
  // });

  // Future<void> popAndPushAll(List<AppRouteInfo> listAppRouteInfo,
  //     {bool useRootNavigator = false});

  // void popUntilRoot({bool useRootNavigator = false});

  // void popUntilRouteName(String routeName);

  // bool removeUntilRouteName(String routeName);

  // bool removeAllRoutesWithName(String routeName);

  // bool removeLast();

  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  });

  Future<T?> showGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transitionBuilder,
    Duration transitionDuration =
        DurationConstants.defaultGeneralDialogTransitionDuration,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    bool useRootNavigator = true,
  });

  Future<T?> showModalBottomSheet<T extends Object?>(
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

// @LazySingleton(as: AppNavigator)
// class AppNavigatorImpl extends AppNavigator with LogMixin {
//   @override
//   // TODO: implement canPopSelfOrChildren
//   bool get canPopSelfOrChildren => throw UnimplementedError();

//   @override
//   // TODO: implement currentBottomTab
//   int get currentBottomTab => throw UnimplementedError();

//   @override
//   String getCurrentRouteName({bool useRootNavigator = false}) {
//     // TODO: implement getCurrentRouteName
//     throw UnimplementedError();
//   }

//   @override
//   Future<T?> showDialog<T extends Object?>(AppPopupInfo appPopupInfo,
//       {bool barrierDismissible = true,
//       bool useSafeArea = false,
//       bool useRootNavigator = true}) {
//     // TODO: implement showDialog
//     throw UnimplementedError();
//   }

//   @override
//   void showErrorSnackBar(String message, {Duration? duration}) {
//     // TODO: implement showErrorSnackBar
//   }

//   @override
//   Future<T?> showGeneralDialog<T extends Object?>(AppPopupInfo appPopupInfo,
//       {Widget Function(BuildContext p1, Animation<double> p2,
//               Animation<double> p3, Widget p4)?
//           transitionBuilder,
//       Duration transitionDuration =
//           DurationConstants.defaultGeneralDialogTransitionDuration,
//       bool barrierDismissible = true,
//       Color barrierColor = const Color(0x80000000),
//       bool useRootNavigator = true}) {
//     // TODO: implement showGeneralDialog
//     throw UnimplementedError();
//   }

//   @override
//   Future<T?> showModalBottomSheet<T extends Object?>(AppPopupInfo appPopupInfo,
//       {bool isScrollControlled = false,
//       bool useRootNavigator = false,
//       bool isDismissible = true,
//       bool enableDrag = true,
//       Color barrierColor = Colors.black54,
//       Color? backgroundColor}) {
//     // TODO: implement showModalBottomSheet
//     throw UnimplementedError();
//   }

//   @override
//   void showSuccessSnackBar(String message, {Duration? duration}) {
//     // TODO: implement showSuccessSnackBar
//   }
// }
