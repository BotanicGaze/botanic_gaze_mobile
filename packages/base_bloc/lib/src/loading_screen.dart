import 'package:base_bloc/src/base_bloc_config.dart';
import 'package:base_bloc/src/di/di.dart';
import 'package:base_bloc/src/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

bool isShow = false;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static void close() {
    if (isShow) {
      isShow = false;
      Navigator.of(getIt<AppNavigator>().globalContext).pop();
    }
  }

  static Future<void> show({
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    bool? keepVisible,
  }) {
    if (isShow) return Future.value();
    isShow = true;
    return showGeneralDialog(
      barrierDismissible: false,
      context: getIt<AppNavigator>().globalContext,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const LoadingScreen(),
        );
      },
      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocConfig.instance.buildPageLoading ??
        Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        );
  }
}
