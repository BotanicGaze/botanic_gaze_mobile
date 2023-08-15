// ignore_for_file: avoid_hardcoded_colors
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class RoundRectangleShimmer extends StatelessWidget {
  const RoundRectangleShimmer({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? Dimens.d16.responsive(),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
      ),
    );
  }
}
