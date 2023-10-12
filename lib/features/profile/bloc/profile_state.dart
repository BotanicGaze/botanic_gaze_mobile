part of 'profile_bloc.dart';

class ProfileState extends BaseBlocState with EquatableMixin {
  const ProfileState({
    this.userInfo,
    this.weatherAlert = true,
    this.careReminder = true,
    this.locationName = '',
    this.exception,
    this.accessToken,
  });

  bool get hasLogin =>
      SpUtil.getString(AppPreferencesKey.apiTokenAuthentication)?.isNotEmpty ??
      false;

  final UserInfoResponse? userInfo;
  final String? accessToken;
  final bool weatherAlert;
  final bool careReminder;
  final String locationName;

  final AppException? exception;

  @override
  List<Object?> get props {
    return [
      userInfo,
      accessToken,
      weatherAlert,
      careReminder,
      locationName,
      exception,
    ];
  }

  ProfileState copyWith({
    UserInfoResponse? userInfoResponse,
    String? accessToken,
    bool? weatherAlert,
    bool? careReminder,
    String? locationName,
    AppException? exception,
  }) {
    return ProfileState(
      userInfo: userInfoResponse ?? userInfo,
      accessToken: accessToken ?? this.accessToken,
      weatherAlert: weatherAlert ?? this.weatherAlert,
      careReminder: careReminder ?? this.careReminder,
      locationName: locationName ?? this.locationName,
      exception: exception ?? this.exception,
    );
  }
}
