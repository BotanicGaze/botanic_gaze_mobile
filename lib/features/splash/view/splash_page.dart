import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/splash/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SplashBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(AppInitialized());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (previous, current) =>
          previous.appInitializedFinish != current.appInitializedFinish,
      listener: (context, state) {
        context.go(NavigationContains.dashBoardPage);
      },
      child: CommonScaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const SizedBox.expand(),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.ease,
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double opacity, Widget? child) {
                return Opacity(
                  opacity: opacity,
                  child: Image.asset(AppImages.splashImage),
                );
              },
            ),
            AppSafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimens.d160.responsive(),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    curve: Curves.ease,
                    duration: const Duration(seconds: 3),
                    builder: (
                      BuildContext context,
                      double opacity,
                      Widget? child,
                    ) {
                      return Opacity(
                        opacity: opacity,
                        child: Image.asset(
                          AppImages.appLogo,
                          width: Dimens.d145.responsive(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        // onFinished: () {
                        //   context.go(NavigationContains.dashBoardPage);
                        // },
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Botanic Gaze',
                            cursor: '',
                            speed: const Duration(milliseconds: 100),
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
