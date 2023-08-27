part of 'splash_bloc.dart';

sealed class SplashEvent extends BaseBlocEvent with EquatableMixin {
  const SplashEvent();
}

class AppInitialized extends SplashEvent {
  @override
  List<Object?> get props => [];
}
