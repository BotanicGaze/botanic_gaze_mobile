import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:shared/shared.dart';

@Injectable()
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(
      _onLoadingVisibilityEmitted,
      transformer: log(),
    );

    on<ExceptionEmitted>(
      _onExceptionEmitted,
      transformer: log(),
    );

    on<ForceLogoutButtonPressed>(
      _onForceLogoutButtonPressed,
      transformer: log(),
    );
  }

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(
      isLoading: state.loadingCount == 0 && event.isLoading
          ? true
          : state.loadingCount == 1 && !event.isLoading ||
                  state.loadingCount <= 0
              ? false
              : state.isLoading,
      loadingCount: event.isLoading
          ? state.loadingCount.plus(1)
          : state.loadingCount.minus(1),
    ));
  }

  FutureOr<void> _onExceptionEmitted(
      ExceptionEmitted event, Emitter<CommonState> emit) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  FutureOr<void> _onForceLogoutButtonPressed(
    ForceLogoutButtonPressed event,
    Emitter<CommonState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        BaseBlocConfig.instance.onForceLogoutButtonPressed?.call();
      },
    );
  }
}
