import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:shared/shared.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@Injectable()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<AppInitialized>(_onAppInitialized);
  }

  Future<void> _onAppInitialized(
    AppInitialized event,
    Emitter<SplashState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
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
