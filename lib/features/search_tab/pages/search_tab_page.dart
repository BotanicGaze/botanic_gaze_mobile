import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/search_tab/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          // const SizedBox.expand(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppImages.imageBgScanSearch),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
            child: Column(
              // crossAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(NavigationContains.searchPage);
                        },
                        child: AppTextField(
                          hintText: 'Monstera Albo',
                          enabled: false,
                          prefixIcon: Hero(
                            tag: AppIcons.iconSearch,
                            child: Image.asset(
                              AppIcons.iconSearch,
                              width: Dimens.d16.responsive(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimens.d8.responsive()),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: Image.asset(AppIcons.iconFilter),
                    )
                  ],
                ),
                SizedBox(height: Dimens.d72.responsive()),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF343434),
                    child: Icon(
                      Icons.question_mark,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: Dimens.d39.responsive()),
                Column(
                  children: [
                    SizedBox(
                      width: Dimens.d116.responsive(),
                      height: Dimens.d116.responsive(),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(NavigationContains.scanPage);
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Dimens.d26.responsive(),
                              bottom: Dimens.d26.responsive(),
                              left: Dimens.d31.responsive(),
                              right: Dimens.d21.responsive(),
                            ),
                            child: Image.asset(
                              AppIcons.iconCamera,
                              // width: Dimens.d64.responsive(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.d8.responsive()),
                    Text(
                      'Scan to identify',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// Returns the text annotation gauge
}
