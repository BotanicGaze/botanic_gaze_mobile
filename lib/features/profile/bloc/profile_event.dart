part of 'profile_bloc.dart';

sealed class ProfileEvent extends BaseBlocEvent with EquatableMixin {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfo extends ProfileEvent {}

class LoginWithFacebook extends ProfileEvent {}

class LoginWithGoogle extends ProfileEvent {}

class SwitchWeatherAlert extends ProfileEvent {}

class SwitchCareReminders extends ProfileEvent {}

class GetLocationName extends ProfileEvent {}

class DailyCheckIn extends ProfileEvent {}

class Logout extends ProfileEvent {}
