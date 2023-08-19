import 'dart:math';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/diagnosis/bloc/diagnosis_bloc.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/widgets.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends BasePageState<DiagnosisPage, DiagnosisBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: Center(
        child: Text('DiagnosisPage${Random().nextInt(100)}'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
