import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/services/location_service.dart';
import 'package:shared/shared.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitialized>(_onAppInitialized);
  }

  Future<void> _onAppInitialized(
    AppInitialized event,
    Emitter<AppState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final location = await getIt<LocationService>().getCurrentPosition();
        Log.d(location.toString());
        final output = await getIt<AppApiService>().getProtected();
        emit(
          state.copyWith(
            appInitializedFinish: output.success,
            xCsrfToken: output.data,
          ),
        );
      },
      doOnError: (e) async {
        Log.d(e);
        return emit(state.copyWith());
      },
      doOnEventCompleted: () async {
        if (state.xCsrfToken != null) {
          await SpUtil.putString(
            AppPreferencesKey.xCsrfTokenKey,
            state.xCsrfToken!,
          );
        }
      },
      handleLoading: false,
      handleRetry: false,
    );
  }
}
