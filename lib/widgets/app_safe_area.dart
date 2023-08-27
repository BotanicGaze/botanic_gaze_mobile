import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppSafeArea extends StatelessWidget {
  const AppSafeArea({
    required this.child,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum,
    super.key,
  });
  final Widget child;
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets? minimum;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum:
          minimum ?? EdgeInsets.symmetric(vertical: Dimens.d12.responsive()),
      child: child,
    );
  }
}
