import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/app_api_service.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

part 'search_event.dart';
part 'search_state.dart';

@Injectable()
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchPageInitiated>(
      _onSearchPageInitiated,
      transformer: log(),
    );
    on<SearchPageLoadMore>(
      _onSearchPageLoadMore,
      transformer: log(),
    );
    on<SearchPageRefreshed>(
      _onSearchPageRefreshed,
      transformer: log(),
    );
    on<SearchTextFieldChanged>(
      _onSearchTextFieldChanged,
      transformer: debounceTime(),
    );
  }

  Future<void> _onSearchPageInitiated(
    SearchPageInitiated event,
    Emitter<SearchState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      request: event.request,
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(
        state.copyWith(
          isShimmerLoading: false,
        ),
      ),
      isInitialLoad: true,
    );
  }

  Future<void> _onSearchPageLoadMore(
    SearchPageLoadMore event,
    Emitter<SearchState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      request: event.request,
      isInitialLoad: false,
    );
  }

  Future<FutureOr<void>> _onSearchPageRefreshed(
    SearchPageRefreshed event,
    Emitter<SearchState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      request: event.request,
      isInitialLoad: true,
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async {
        emit(state.copyWith(isShimmerLoading: false));
        if (!event.completer.isCompleted) {
          event.completer.complete();
        }
      },
    );
  }

  Future<void> _onSearchTextFieldChanged(
    SearchTextFieldChanged event,
    Emitter<SearchState> emit,
  ) async {
    await _getPlantDatas(
      emit: emit,
      request: event.request,
      isInitialLoad: true,
    );
  }

  Future<void> _getPlantDatas({
    required Emitter<SearchState> emit,
    required bool isInitialLoad,
    required PlantSearchRequest request,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().getListPlant(request);
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
        emit(state.copyWith(loadTaskException: e));
      },
      doOnSubscribe: doOnSubscribe,
      doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
      handleRetry: false,
    );
  }
}
