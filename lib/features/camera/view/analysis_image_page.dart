import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnalysisImagePage extends StatefulWidget {
  const AnalysisImagePage({required this.imagePath, super.key});
  final String imagePath;

  @override
  State<AnalysisImagePage> createState() => _AnalysisImagePageState();
}

class _AnalysisImagePageState
    extends BasePageState<AnalysisImagePage, AnalysisImageBlocBloc>
    with SingleTickerProviderStateMixin {
  late AnimationController linearAnimationController;
  late Animation<double> linearAnimation;
  final pageController = PageController(viewportFraction: 0.8);

  double animationValue = 0;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    linearAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    linearAnimation =
        CurvedAnimation(parent: linearAnimationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {
              animationValue = linearAnimation.value * 360;
            });
          });
    linearAnimationController.repeat();
    bloc.add(AnalyzingImage(File(widget.imagePath)));
  }

  @override
  void dispose() {
    linearAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    final width = ScreenUtil().screenWidth * 0.75;
    return CommonScaffold(
      otherBackground: otherBackground(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: BlocBuilder<AnalysisImageBlocBloc, AnalysisImageBlocState>(
        builder: (context, state) {
          if (state.identifyData != null) {
            return PageView.builder(
              controller: pageController,
              itemCount: state.identifyData?.plants?.length ?? 0,
              itemBuilder: (context, index) {
                final plant = state.identifyData?.plants?[index];
                final size = MediaQuery.of(context).size;
                final isExpanded = pageIndex == index;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      bottom: isExpanded ? 40 : 100,
                      width: isExpanded ? size.width * 0.78 : size.width * 0.7,
                      height:
                          isExpanded ? size.height * 0.6 : size.height * 0.5,
                      child: ExpandedContentWidget(plant: plant),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      bottom: isExpanded ? 150 : 100,
                      child: ImageWidget(plant: plant),
                    ),
                  ],
                );
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            );
          }
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
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        showLabels: false,
                        showTicks: false,
                        startAngle: 0,
                        endAngle: 360,
                        // radiusFactor: 0.5,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 0.05,
                          color: Color(0xFFE6F2ED),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      ),
                      RadialAxis(
                        showLabels: false,
                        showTicks: false,
                        startAngle: animationValue,
                        endAngle: animationValue + 200,
                        // radiusFactor: 0.5,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.05,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Theme.of(context).primaryColor,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      ),
                    ],
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
                  )
                ],
              ),
              SizedBox(height: Dimens.d20.responsive()),
              const Text('Just a sec. Collecting leaves...'),
              SizedBox(height: Dimens.d8.responsive()),
              const Text('It may take a few seconds.')
            ],
          );
        },
      ),
    );
  }

  List<Widget> otherBackground() {
    return [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.imageBackground1,
          width: ScreenUtil().screenHeight * 0.2,
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            AppImages.imageBackground2,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Opacity(
          opacity: 0.4,
          child: Image.asset(
            AppImages.imageBackground3,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      )
    ];
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, this.plant});

  // const ImageWidget({
  //   required this.plant,
  // }) : super(key: key);
  final Plant? plant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       buildTopText(),
            //       // LatLongWidget(location: location),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedImageWidget(
            imageUrl: plant?.images?.first.mediumImageUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
      );

  // Widget buildTopText() => Text(
  //       location.name,
  //       style: const TextStyle(
  //         color: Colors.white,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 20,
  //       ),
  //     );
}

class ExpandedContentWidget extends StatelessWidget {
  const ExpandedContentWidget({super.key, this.plant});

  final Plant? plant;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('location.addressLine1'),
            const SizedBox(height: 8),
            buildAddressRating(plant: plant),
            const SizedBox(height: 12),
            buildReview(plant: plant)
          ],
        ),
      );

  Widget buildAddressRating({
    Plant? plant,
  }) =>
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'location.addressLine2',
            style: TextStyle(color: Colors.black45),
          ),
          // StarsWidget(stars: location.starRating),
        ],
      );

  Widget buildReview({
    Plant? plant,
  }) =>
      const SizedBox();
  // Row(
  //   children: location.reviews
  //       .map(
  //         (review) => Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 4),
  //           child: CircleAvatar(
  //             radius: 16,
  //             backgroundColor: Colors.black12,
  //             backgroundImage: AssetImage(review.urlImage),
  //           ),
  //         ),
  //       )
  //       .toList(),
  // );
}
