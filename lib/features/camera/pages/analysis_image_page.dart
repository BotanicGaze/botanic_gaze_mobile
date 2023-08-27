import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';

class AnalysisImagePage extends StatefulWidget {
  const AnalysisImagePage({required this.imagePath, super.key});
  final String imagePath;

  @override
  State<AnalysisImagePage> createState() => _AnalysisImagePageState();
}

class _AnalysisImagePageState
    extends BasePageState<AnalysisImagePage, AnalysisImageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      otherBackground: otherBackground(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BlocBuilder<AnalysisImageBloc, AnalysisImageState>(
          builder: (context, state) {
            return state.identifyData != null
                ? const Text('Analyzing results')
                : const SizedBox();
          },
        ),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
      body: BlocBuilder<AnalysisImageBloc, AnalysisImageState>(
        builder: (context, state) {
          if (state.identifyData != null) {
            return AnalyzingImageResultView(identifyData: state.identifyData);
          }
          return AnalyzingImageView(imagePath: widget.imagePath);
        },
      ),
    );
  }

  List<Widget> otherBackground() {
    return [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.imageBackground1,
          width: ScreenUtil().screenHeight * 0.2,
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            AppImages.imageBackground2,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Opacity(
          opacity: 0.4,
          child: Image.asset(
            AppImages.imageBackground3,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      )
    ];
  }
}
