part of 'app_bloc.dart';

sealed class AppEvent extends BaseBlocEvent with EquatableMixin {
  const AppEvent();
}

class AppInitialized extends AppEvent {
  @override
  List<Object?> get props => [];
}
