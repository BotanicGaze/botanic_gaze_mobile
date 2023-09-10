import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController linearAnimationController;
  late Animation<double> linearAnimation;

  @override
  void initState() {
    super.initState();
    linearAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    linearAnimation = CurvedAnimation(
      parent: linearAnimationController,
      curve: Curves.linear,
    );

    linearAnimationController.repeat();
  }

  @override
  void dispose() {
    linearAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = ScreenUtil().screenWidth * .23;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          AnimatedBuilder(
            animation: linearAnimationController,
            builder: (context, child) {
              return SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    showLabels: false,
                    showTicks: false,
                    startAngle: linearAnimation.value * 360,
                    endAngle: (linearAnimation.value * 360) + 200,
                    radiusFactor: 0.25,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.05,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Theme.of(context).primaryColor,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            width: width,
            height: width,
            child: const CircleAvatar(
              backgroundImage: AssetImage(AppImages.appLogo),
            ),
          )
        ],
      ),
    );
  }
}
