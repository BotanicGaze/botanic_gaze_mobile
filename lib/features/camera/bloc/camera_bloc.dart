// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:camera/camera.dart';
import 'package:permission_client/permission_client.dart';
import 'package:shared/shared.dart';

part 'camera_event.dart';
part 'camera_state.dart';

@Injectable()
class CameraBloc extends BaseBloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CheckPermissionCamera>(_initCameraScan);
    on<InitializeCamera>(_initializeCamera);
    on<TakeImageButtonPressed>(_takeImageButtonPressed);
  }

  Future<void> _initCameraScan(
    CheckPermissionCamera event,
    Emitter<CameraState> emit,
  ) async {
    final permissionStatus = await getPermissionStatus();
    emit(
      state.copyWith(permissionStatus: permissionStatus),
    );
  }

  Future<FutureOr<void>> _initializeCamera(
    InitializeCamera event,
    Emitter<CameraState> emit,
  ) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    final previousCameraController = state.cameraController;

    await previousCameraController?.dispose();

    // Instantiating the camera controller
    final cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio: false,
    );

    await cameraController.initialize();
    emit(
      state.copyWith(
        cameraController: cameraController,
        isCameraInitialized: cameraController.value.isInitialized,
      ),
    );
  }

  Future<void> _takeImageButtonPressed(
    TakeImageButtonPressed event,
    Emitter<CameraState> emit,
  ) async {
    if (state.cameraController == null) return;
    final cameraController = state.cameraController!;

    if (cameraController.value.isTakingPicture) {
      return;
    }

    try {
      final file = await cameraController.takePicture();
      // await cameraController.pausePreview();
      emit(state.copyWith(imageTaken: file));
      Log.d('Image path: ${file.path}');
    } on CameraException catch (e) {
      Log.e('Error occurred while taking picture: $e');
      return;
    }
  }

  Future<PermissionStatus> getPermissionStatus() async {
    await const PermissionClient().requestCamera();
    final status = await const PermissionClient().cameraStatus();
    if (status.isGranted) {
      Log.d('Camera Permission: GRANTED');
      return status;
    } else {
      Log.d('Camera Permission: DENIED');
      if (getIt<AppNavigator>().globalContext.mounted) {
        await PermissionPopup.show(
          getIt<AppNavigator>().globalContext,
          type: PermissionType.camera,
        );
      }

      return PermissionStatus.denied;
    }
  }
}
