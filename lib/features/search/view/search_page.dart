import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/search/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'search_tab_page',
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 50,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
