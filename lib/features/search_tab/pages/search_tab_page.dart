import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/search_tab/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends BasePageState<SearchTabPage, SearchTabBloc>
    with SingleTickerProviderStateMixin {
  late AnimationController linearAnimationController;
  late CurvedAnimation linearAnimation;
  double animationValue = 0;
  @override
  void initState() {
    super.initState();

    /// Linear animation
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
  }

  @override
  void dispose() {
    linearAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(NavigationContains.searchPage);
            },
            child: Hero(
              tag: 'search_tab_page',
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 50,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(height: 50),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 0,
                endAngle: 360,
                radiusFactor: 1,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.05,
                  color: Colors.blue.withOpacity(0.15),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              ),
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: animationValue,
                endAngle: animationValue + 260,
                radiusFactor: 1,
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.05,
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.blue,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// Returns the text annotation gauge
}
