import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/dash_board/dash_board.dart';
import 'package:botanic_gaze/features/explore/pages/view.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/features/search_tab/index.dart';
import 'package:botanic_gaze/services/dynamic_link_service.dart';
import 'package:botanic_gaze/services/global_callback.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

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

  double get indicatorWidth => width / bottomNavigationBarItems.length;

  double get indicatorHeight => Dimens.d3.responsive();

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    FirebaseDynamicLinksService.initDynamicLinks();
    getIt<GlobalCallback>().changeDashboardTab = _changeDashboardTab;
  }

  void _changeDashboardTab(int value) {
    setState(() => currentIndex = value);
    pageController.jumpToPage(value);
  }

  List<Widget> tabView = [
    const SearchTabPage(),
    const MyGardenPage(),
    const ExplorePage(),
    const ProfilePage(),
  ];

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        BottomNavigationBarItem(
          icon: _bottomIcon(AppIcons.iconIdentifyTab, 0),
          label: 'Identify',
        ),
        BottomNavigationBarItem(
          icon: _bottomIcon(AppIcons.iconDiagnoseTab, 1),
          label: 'Diagnosis',
        ),
        BottomNavigationBarItem(
          icon: _bottomIcon(AppIcons.iconExploreTab, 2),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: _bottomIcon(AppIcons.iconProfileTab, 3),
          label: 'Profile',
        ),
      ];

  SizedBox _bottomIcon(String imagePath, int index) {
    return SizedBox(
      width: Dimens.d24.responsive(),
      height: Dimens.d24.responsive(),
      child: Padding(
        padding: EdgeInsets.all(Dimens.d3.responsive()),
        child: Image.asset(
          imagePath,
          color: currentIndex == index ? Theme.of(context).primaryColor : null,
        ),
      ),
    );
  }

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
          bottomNavigationBar: Stack(
            children: [
              BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(0.75),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: bottomNavigationBarItems,
                currentIndex: currentIndex,
                selectedFontSize: 12,
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
                  child: Container(
                    height: indicatorHeight,
                    // color: Colors.amber,
                    color: Theme.of(context).primaryColor,
                  ),
                  // color: Colors.amber,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
