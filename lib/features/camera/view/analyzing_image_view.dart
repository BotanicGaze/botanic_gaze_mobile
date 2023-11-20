import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnalyzingImageView extends StatefulWidget {
  const AnalyzingImageView({
    required this.imagePath,
    super.key,
  });

  final String imagePath;

  @override
  State<AnalyzingImageView> createState() => _AnalyzingImageViewState();
}

class _AnalyzingImageViewState extends State<AnalyzingImageView>
    with SingleTickerProviderStateMixin {
  late AnimationController linearAnimationController;
  late Animation<double> linearAnimation;
  final pageController = PageController(viewportFraction: 0.8);

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
    context
        .read<AnalysisImageBloc>()
        .add(AnalyzingImage(File(widget.imagePath)));
  }

  @override
  void dispose() {
    linearAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = ScreenUtil().screenWidth * 0.9;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Analyzing plant ...',
              textStyle: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 300),
            ),
          ],
        ),
        SizedBox(height: Dimens.d20.responsive()),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedBuilder(
              animation: linearAnimationController,
              builder: (context, child) {
                return SfRadialGauge(
                  // backgroundColor: Colors.black,
                  axes: <RadialAxis>[
                    RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      startAngle: 0,
                      endAngle: 360,
                      radiusFactor: 1,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.05,
                        color: Color(0xFFE6F2ED),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                    ),
                    RadialAxis(
                      showLabels: false,
                      showTicks: false,
                      startAngle: linearAnimation.value * 360,
                      endAngle: (linearAnimation.value * 360) + 200,
                      radiusFactor: 1,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(width / 2),
              child: Container(
                width: width,
                height: width,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimens.d20.responsive()),
        const Text('Just a sec. Collecting leaves...'),
        SizedBox(height: Dimens.d8.responsive()),
        const Text('It may take a few seconds.'),
      ],
    );
  }
}
