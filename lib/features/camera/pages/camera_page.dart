import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/camera/index.dart';
import 'package:botanic_gaze/navigation/screen_paths.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_client/permission_client.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends BasePageState<CameraPage, CameraBloc>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    bloc.add(CheckPermissionCamera());
  }

  // @override
  // void deactivate() {
  //   bloc.state.cameraController?.dispose();
  //   super.deactivate();
  // }

  @override
  void dispose() {
    bloc.state.cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CameraBloc, CameraState>(
          listenWhen: (previous, current) {
            return previous.imageTaken != current.imageTaken &&
                current.imageTaken != null;
          },
          listener: (context, state) {
            if (state.imageTaken != null) {
              context.pushReplacementNamed(
                ScreenPaths.analysisImagePage,
                extra: {
                  'image_path': state.imageTaken?.path,
                },
              );
            }
          },
        ),
        BlocListener<CameraBloc, CameraState>(
          listenWhen: (previous, current) {
            return current.permissionStatus != previous.permissionStatus;
          },
          listener: (context, state) {
            if (state.permissionStatus.isGranted) {
              bloc.add(InitializeCamera());
            }
          },
        ),
      ],
      child: CommonScaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            if (!state.permissionStatus.isGranted) {
              return const CameraPermissionDeniedView();
            }
            return const CameraPreviewView(
                // bloc: bloc,
                // showFlash: _showFlash,
                );
          },
        ),
        bottomNavigationBar: const CameraBottomButtonView(),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final cameraController = bloc.state.cameraController;

    if (!(cameraController?.value.isInitialized ?? false)) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      cameraController?.initialize();
    }
  }
}
