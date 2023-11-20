import 'dart:async';
import 'dart:io';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/services/location_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared/shared.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@LazySingleton()
class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    // commonBloc = appCommonBloc;
    on<GetUserInfo>(_onGetUserInfo);
    on<LoginWithFacebook>(_onLoginWithFacebook);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<SwitchWeatherAlert>(_onSwitchWeatherAlert);
    on<SwitchCareReminders>(_onSwitchCareReminders);
    on<GetLocationName>(_onGetLocationName);
    on<DailyCheckIn>(_onDailyCheckIn);
    on<Logout>(_onLogout);
  }

  // final CommonBloc appCommonBloc;

  Future<void> _onLoginWithFacebook(
    LoginWithFacebook event,
    Emitter<ProfileState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await FacebookAuth.instance.logOut();
        final result = await FacebookAuth.instance.login();
        if (result.status == LoginStatus.success) {
          Log.d(result.accessToken?.token);
          final accessToken = result.accessToken!;
          final output = await getIt<AppApiService>().loginWithSocial(
            AccountLoginType.facebook,
            accessToken.token,
          );
          emit(
            state.copyWith(
              userInfoResponse: output.data?.user,
              accessToken: output.data?.token,
            ),
          );
        } else {
          Log.d(result.status);
          Log.d(result.message);
        }
      },
      doOnError: (e) async {
        Log.e(e);
        emit(state.copyWith(exception: e));
      },
      doOnSuccessOrError: () async {
        if (state.accessToken != null) {
          await SpUtil.putString(
            AppPreferencesKey.apiTokenAuthentication,
            state.accessToken ?? '',
          );
        }
      },
    );
  }

  Future<void> _onLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<ProfileState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final googleUser = await GoogleSignIn().signIn();
        // Obtain the auth details from the request
        final googleAuth = await googleUser?.authentication;
        if (googleAuth?.accessToken == null) return;
        final output = await getIt<AppApiService>().loginWithSocial(
          AccountLoginType.google,
          googleAuth?.accessToken ?? '',
        );
        emit(
          state.copyWith(
            userInfoResponse: output.data?.user,
            accessToken: output.data?.token,
          ),
        );
      },
      doOnError: (e) async {
        Log.e(e);
        emit(state.copyWith(exception: e));
      },
      handleError: false,
      handleLoading: false,
      doOnSuccessOrError: () async {
        if (state.accessToken != null) {
          await SpUtil.putString(
            AppPreferencesKey.apiTokenAuthentication,
            state.accessToken ?? '',
          );
        }
      },
    );
  }

  Future<void> _onGetUserInfo(
    GetUserInfo event,
    Emitter<ProfileState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        if (!state.hasLogin) return;
        final output = await getIt<AppApiService>().getUserInfo();
        emit(
          state.copyWith(userInfoResponse: output.data),
        );
      },
      doOnError: (e) async => Log.e(e),
      doOnSuccessOrError: () async => Log.d('Get user info successfully'),
      handleLoading: false,
    );
  }

  Future<void> _onSwitchWeatherAlert(
    SwitchWeatherAlert event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(weatherAlert: !state.weatherAlert));
  }

  Future<void> _onSwitchCareReminders(
    SwitchCareReminders event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(careReminder: !state.careReminder));
  }

  Future<void> _onGetLocationName(
    GetLocationName event,
    Emitter<ProfileState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final position = await getIt<LocationService>().getCurrentPosition();
        if (position == null) return;
        final output = await getIt<AppApiService>()
            .getLocationFromLatLng(position.latitude, position.longitude);
        emit(
          state.copyWith(locationName: output),
        );
      },
      handleLoading: false,
    );
  }

  Future<void> _onLogout(Logout event, Emitter<ProfileState> emit) async {
    await SpUtil.remove(AppPreferencesKey.apiTokenAuthentication);
    emit(
      ProfileState(
        weatherAlert: state.weatherAlert,
        careReminder: state.careReminder,
        locationName: state.locationName,
      ),
    );
  }

  Future<void> _onDailyCheckIn(
    DailyCheckIn event,
    Emitter<ProfileState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        if (!state.hasLogin) return;
        final output = await getIt<AppApiService>().dailyCheckIn();
        emit(
          state.copyWith(userInfoResponse: output.data),
        );
      },
      handleLoading: false,
      doOnError: (e) async {
        Log.e(e);
        if (e is RemoteException) {
          if (e.httpErrorCode == HttpStatus.unauthorized) {
            await SpUtil.remove(AppPreferencesKey.apiTokenAuthentication);
          }
        }
      },
    );
  }
}
