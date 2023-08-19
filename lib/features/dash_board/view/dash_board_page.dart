import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/features/dash_board/dash_board.dart';
import 'package:botanic_gaze/features/diagnosis/pages/diagnosis_page.dart';
import 'package:botanic_gaze/features/explore/pages/view.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/features/search_tab/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashBoardCubit(),
      child: const DashBoardView(),
    );
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int currentIndex = 0;

  double get width => ScreenUtil().screenWidth;

  double get bottomNavPadding => Dimens.d16.w;

  double get indicatorWidth =>
      (width - bottomNavPadding * 2) / bottomNavigationBarItems.length;

  double get indicatorHeight => Dimens.d3;

  final PageController pageController = PageController();

  List<Widget> tabView = [
    const SearchTabPage(),
    const DiagnosisPage(),
    const ExplorePage(),
    const ProfilePage()
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit_outlined),
      label: 'Search tab',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit_outlined),
      label: 'Diagnosis tab',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit_outlined),
      label: 'Explore tab',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit_outlined),
      label: 'Profile tab',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        return CommonScaffold(
          body: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tabView.length,
            itemBuilder: (context, index) {
              return tabView[index];
            },
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.all(bottomNavPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Stack(
                  children: [
                    BottomNavigationBar(
                      elevation: 0,
                      backgroundColor: Colors.white.withOpacity(0.75),
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      items: bottomNavigationBarItems,
                      currentIndex: currentIndex,
                      onTap: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                        pageController.jumpToPage(value);
                      },
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      // bottom: 0,
                      left: indicatorWidth * currentIndex,
                      child: SizedBox(
                        width: indicatorWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: indicatorWidth * 0.35,
                          ),
                          child: Container(
                            height: indicatorHeight,
                            color: Colors.amber,
                          ),
                        ),
                        // color: Colors.amber,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
