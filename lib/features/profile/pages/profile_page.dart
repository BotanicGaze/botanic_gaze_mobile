import 'dart:math';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage, ProfileBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Text('ProfilePage${Random().nextInt(100)}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
