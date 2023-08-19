import 'dart:math';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends BasePageState<ExplorePage, ExploreBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Text('ExplorePage${Random().nextInt(100)}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
