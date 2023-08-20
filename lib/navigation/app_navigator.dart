import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/dash_board/view/view.dart';
import 'package:botanic_gaze/features/scan/index.dart';
import 'package:botanic_gaze/features/search/view/view.dart';
import 'package:botanic_gaze/features/splash/splash.dart';
import 'package:botanic_gaze/navigation/navigation_contains.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  @override
  GoRouter get router => GoRouter(
        navigatorKey: appNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: NavigationContains.rootPage,
            name: NavigationContains.rootPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SplashPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: NavigationContains.dashBoardPage,
            name: NavigationContains.dashBoardPage,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const DashBoardPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            path: NavigationContains.searchPage,
            name: NavigationContains.searchPage,
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: NavigationContains.scanPage,
            name: NavigationContains.scanPage,
            builder: (context, state) => const ScanPage(),
          ),
        ],
      );

  @override
  bool get canPopSelfOrChildren => throw UnimplementedError();

  @override
  int get currentBottomTab => throw UnimplementedError();

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) {
    throw UnimplementedError();
    // return GoRouterState.of(navigatorKey.currentState!.context).name ?? '';
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => appNavigatorKey;

  @override
  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    throw UnimplementedError();
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {}

  @override
  Future<T?> showGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    Widget Function(
      BuildContext p1,
      Animation<double> p2,
      Animation<double> p3,
      Widget p4,
    )? transitionBuilder,
    Duration transitionDuration =
        DurationConstants.defaultGeneralDialogTransitionDuration,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    bool useRootNavigator = true,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<T?> showModalBottomSheet<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color barrierColor = Colors.black54,
    Color? backgroundColor,
  }) {
    throw UnimplementedError();
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {}
}
