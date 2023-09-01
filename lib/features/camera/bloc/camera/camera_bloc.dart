// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_client/permission_client.dart';
import 'package:shared/shared.dart';

part 'camera_event.dart';
part 'camera_state.dart';

@Injectable()
class CameraBloc extends BaseBloc<CameraEvent, CameraState> {
  CameraBloc() : super(const CameraState()) {
    on<CheckPermissionCamera>(_onCheckPermissionCamera);
    on<InitializeCamera>(_onInitializeCamera);
    on<TakeImageButtonPressed>(_onTakeImageButtonPressed);
    on<PickImageButtonPressed>(_onPickImageButtonPressed);
  }

  Future<void> _onCheckPermissionCamera(
    CheckPermissionCamera event,
    Emitter<CameraState> emit,
  ) async {
    final permissionStatus = await getPermissionStatus();
    emit(
      state.copyWith(permissionStatus: permissionStatus),
    );
  }

  Future<FutureOr<void>> _onInitializeCamera(
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

  Future<void> _onTakeImageButtonPressed(
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

  Future<PermissionStatus> getPhotosPermission() async {
    await const PermissionClient().requestPhotos();
    final status = await const PermissionClient().photosStatus();
    if (status.isGranted) {
      Log.d('Photo Permission: GRANTED');
      return status;
    } else {
      Log.d('Photo Permission: DENIED');
      if (getIt<AppNavigator>().globalContext.mounted) {
        await PermissionPopup.show(
          getIt<AppNavigator>().globalContext,
          type: PermissionType.camera,
        );
      }

      return PermissionStatus.denied;
    }
  }

  Future<void> _onPickImageButtonPressed(
    PickImageButtonPressed event,
    Emitter<CameraState> emit,
  ) async {
    final permissionStatus = await getPhotosPermission();
    if (permissionStatus.isGranted) {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        emit(state.copyWith(imageTaken: image));
      }
    }
  }
}
