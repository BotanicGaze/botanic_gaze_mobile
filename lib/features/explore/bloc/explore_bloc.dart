import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/services/location_service.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

part 'explore_event.dart';
part 'explore_state.dart';

@Injectable()
class ExploreBloc extends BaseBloc<ExploreEvent, ExploreState> {
  ExploreBloc()
      : super(
          ExploreState(
            currentSeason: SeasonOfInterestX.seasonByDate(DateTime.now()),
          ),
        ) {
    on<GetWeatherData>(_onGetWeatherData);
    on<GetFlowerOfSeason>(_onGetFlowerOfSeason);
    on<PopularPlantInit>(
      _onPopularPlantInit,
      transformer: log(),
    );
    on<PopularPlantLoadMore>(
      _onPopularPlantLoadMore,
      transformer: log(),
    );
    on<PopularPlantRefreshed>(
      _onPopularPlantRefreshed,
      transformer: log(),
    );
  }

  Future<void> _onGetWeatherData(
    GetWeatherData event,
    Emitter<ExploreState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final position = await getIt<LocationService>().getCurrentPosition();
        if (position != null) {
          final result = await getIt<AppApiService>()
              .getWeatherData(position.latitude, position.longitude);
          emit(
            state.copyWith(
              weatherResponse: result.data,
            ),
          );
        }
      },
      doOnError: (e) async {},
      // doOnSubscribe: doOnSubscribe,
      // doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
      handleRetry: false,
    );
  }

  Future<void> _onGetFlowerOfSeason(
    GetFlowerOfSeason event,
    Emitter<ExploreState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().getListPlant(
          const PlantSearchRequest(q: 'flower', seasonOfInterest: [3]),
        );
        emit(
          state.copyWith(
            flowerOfSeason: output.data,
          ),
        );
      },
      doOnError: (e) async {},
      // doOnSubscribe: doOnSubscribe,
      // doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
      handleRetry: false,
    );
  }

  Future<void> _onPopularPlantInit(
    PopularPlantInit event,
    Emitter<ExploreState> emit,
  ) async {
    return await _getPopularPlant(
      emit: emit,
      page: event.page,
      doOnSubscribe: () async => emit(
        state.copyWith(
            // isShimmerLoading: true,
            ),
      ),
      doOnSuccessOrError: () async => emit(
        state.copyWith(
            // isShimmerLoading: false,
            ),
      ),
      isInitialLoad: true,
    );
  }

  Future<void> _onPopularPlantLoadMore(
    PopularPlantLoadMore event,
    Emitter<ExploreState> emit,
  ) async {
    return await _getPopularPlant(
      emit: emit,
      page: event.page,
      isInitialLoad: false,
    );
  }

  Future<void> _onPopularPlantRefreshed(
    PopularPlantRefreshed event,
    Emitter<ExploreState> emit,
  ) async {}

  Future<void> _getPopularPlant({
    required Emitter<ExploreState> emit,
    required bool isInitialLoad,
    required int page,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().getPopularPlant(page);
        emit(
          state.copyWith(
            popularPlant: LoadMoreOutput<PopularPlantModel>(
              data: output.data,
              isRefreshSuccess: isInitialLoad,
              isLastPage: output.data.isEmpty,
            ),
          ),
        );
      },
      doOnError: (e) async {
        // emit(state.copyWith(loadTaskException: e));
        Log.e(e);
      },
      doOnSubscribe: doOnSubscribe,
      doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
      handleRetry: false,
    );
  }
}
