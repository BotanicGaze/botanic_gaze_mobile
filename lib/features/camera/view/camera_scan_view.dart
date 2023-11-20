import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewView extends StatelessWidget {
  const CameraPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraBloc, CameraState>(
      builder: (context, state) {
        return Stack(
          children: [
            const SizedBox.expand(),
            _buildCameraPreview(state),
            _cameraOverlay(context),
          ],
        );
      },
    );
  }

  Widget _cameraOverlay(BuildContext context) {
    return AppSafeArea(
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
                onPressed: () {
                  context.pop();
                },
                icon: Image.asset(AppIcons.iconClose),
              ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(CameraState state) {
    if (state.isCameraInitialized) {
      return LayoutBuilder(
        builder: (context, boxConstraints) {
          final camera = state.cameraController!.value;
          var scale = boxConstraints.biggest.aspectRatio * camera.aspectRatio;
          if (scale < 1) scale = 1 / scale;
          return Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(state.cameraController!),
            ),
          );
        },
      );
    } else {
      return const SizedBox.expand();
    }
  }
}
