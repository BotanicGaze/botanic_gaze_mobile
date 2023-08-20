import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/search_tab/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends BasePageState<SearchTabPage, SearchTabBloc> {
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
          GestureDetector(
            onTap: () {
              context.pushNamed(NavigationContains.scanPage);
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
