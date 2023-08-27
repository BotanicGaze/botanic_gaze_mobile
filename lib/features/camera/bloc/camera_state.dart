part of 'camera_bloc.dart';

class CameraState extends BaseBlocState with EquatableMixin {
  const CameraState({
    this.permissionStatus = PermissionStatus.denied,
    this.cameraController,
    this.isCameraInitialized = false,
    this.imageTaken,
  });

  final PermissionStatus permissionStatus;
  final CameraController? cameraController;
  final bool isCameraInitialized;
  final XFile? imageTaken;

  @override
  List<Object?> get props => [
        permissionStatus,
        cameraController,
        isCameraInitialized,
        imageTaken,
      ];

  CameraState copyWith({
    PermissionStatus? permissionStatus,
    CameraController? cameraController,
    bool? isCameraInitialized,
    XFile? imageTaken,
  }) {
    return CameraState(
      permissionStatus: permissionStatus ?? this.permissionStatus,
      cameraController: cameraController ?? this.cameraController,
      isCameraInitialized: isCameraInitialized ?? this.isCameraInitialized,
      imageTaken: imageTaken ?? this.imageTaken,
    );
  }
}
