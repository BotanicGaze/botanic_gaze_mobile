import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/scan/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/widgets.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends BasePageState<ScanPage, ScanBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const CommonScaffold(
      body: Center(
        child: Text('ScanPage'),
      ),
    );
  }
}
