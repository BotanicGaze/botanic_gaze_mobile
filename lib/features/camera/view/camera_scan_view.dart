import 'package:app_ui/app_ui.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScanView extends StatelessWidget {
  const CameraScanView({
    required bool showFlash,
    required this.bloc,
    super.key,
  }) : _showFlash = showFlash;

  final CameraBloc bloc;
  final bool _showFlash;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox.expand(),
        if (bloc.state.isCameraInitialized)
          LayoutBuilder(
            builder: (context, boxConstraints) {
              final camera = bloc.state.cameraController!.value;
              var scale =
                  boxConstraints.biggest.aspectRatio * camera.aspectRatio;
              if (scale < 1) scale = 1 / scale;
              return Transform.scale(
                scale: scale,
                child: Center(
                  child: CameraPreview(bloc.state.cameraController!),
                ),
              );
            },
          )
        else
          const SizedBox.expand(),
        SafeArea(
          minimum: EdgeInsets.all(Dimens.d20.responsive()),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppIcons.iconFlash),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(AppIcons.iconClose),
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    AppImages.imageScanFrame,
                    width: Dimens.d290.responsive(),
                    height: Dimens.d290.responsive(),
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: _showFlash,
          child: Container(
            color: Colors.white.withOpacity(0.75),
          ),
        ),
      ],
    );
  }
}
