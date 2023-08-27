part of 'camera_bloc.dart';

sealed class CameraEvent extends BaseBlocEvent with EquatableMixin {
  const CameraEvent();
}

class CheckPermissionCamera extends CameraEvent {
  @override
  List<Object?> get props => [];
}

class InitializeCamera extends CameraEvent {
  @override
  List<Object?> get props => [];
}

class TakeImageButtonPressed extends CameraEvent {
  @override
  List<Object?> get props => [];
}

class PickImageButtonPressed extends CameraEvent {
  @override
  List<Object?> get props => [];
}
