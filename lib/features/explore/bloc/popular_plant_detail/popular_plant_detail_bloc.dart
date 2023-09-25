import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

part 'popular_plant_detail_event.dart';
part 'popular_plant_detail_state.dart';

@Injectable()
class PopularPlantListDetailBloc
    extends BaseBloc<PopularPlantListDetailEvent, PopularPlantListDetailState> {
  PopularPlantListDetailBloc() : super(const PopularPlantListDetailState()) {
    on<ListInitiated>(
      _onListInitiated,
      transformer: log(),
    );
    on<ListLoadMore>(
      _onListLoadMore,
      transformer: log(),
    );
  }

  Future<void> _onListInitiated(
    ListInitiated event,
    Emitter<PopularPlantListDetailState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      plantNames: event.plantNames,
      page: 1,
      doOnSubscribe: () async => emit(
        state.copyWith(isShimmerLoading: true),
      ),
      doOnSuccessOrError: () async => emit(
        state.copyWith(isShimmerLoading: false),
      ),
      isInitialLoad: true,
    );
  }

  Future<void> _onListLoadMore(
    ListLoadMore event,
    Emitter<PopularPlantListDetailState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      plantNames: event.plantNames,
      page: 1,
      isInitialLoad: false,
    );
  }

  Future<void> _getPlantDatas({
    required Emitter<PopularPlantListDetailState> emit,
    required bool isInitialLoad,
    // required PlantSearchRequest request,
    required String plantNames,
    required int page,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().getListPlant(
          PlantSearchRequest(
            page: page,
            q: plantNames,
          ),
        );
        emit(
          state.copyWith(
            plantDatas: LoadMoreOutput<PlantSearchResponse>(
              data: output.data,
              isRefreshSuccess: isInitialLoad,
              isLastPage: output.data.isEmpty,
            ),
          ),
        );
      },
      doOnError: (e) async {
        // emit(state.copyWith(loadTaskException: e));
      },
      doOnSubscribe: doOnSubscribe,
      doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
      handleRetry: false,
    );
  }
}
