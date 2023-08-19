part of 'profile_bloc.dart';

sealed class ProfileEvent extends BaseBlocEvent with EquatableMixin {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
