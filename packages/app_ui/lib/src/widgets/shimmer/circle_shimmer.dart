// ignore_for_file: avoid_hardcoded_colors
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CircleShimmer extends StatelessWidget {
  const CircleShimmer({super.key, this.diameter});

  // const CircleShimmer({
  //   this.diameter,
  //   super.key,
  // });

  final double? diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter ?? Dimens.d32.responsive(),
      height: diameter ?? Dimens.d32.responsive(),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
