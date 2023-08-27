import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.backgroundColor,
    this.hideKeyboardWhenTouchOutside = true,
    super.key,
    this.bottomNavigationBar,
    this.extendBody = false,
    this.otherBackground = const [],
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool hideKeyboardWhenTouchOutside;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  final List<Widget> otherBackground;

  @override
  Widget build(BuildContext context) {
    final scaffold = Stack(
      children: [
        const SizedBox.expand(),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFF2F8F6),
              ],
            ),
          ),
        ),
        ...otherBackground,
        Scaffold(
          backgroundColor: backgroundColor ?? Colors.transparent,
          extendBody: extendBody,
          body: Shimmer(child: body),
          appBar: appBar,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );

    return hideKeyboardWhenTouchOutside
        ? GestureDetector(
            onTap: () => ViewUtils.hideKeyboard(context),
            child: scaffold,
          )
        : scaffold;
  }
}
