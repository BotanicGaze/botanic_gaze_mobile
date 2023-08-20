import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
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
  }

  Future<void> _onSearchPageInitiated(
    SearchPageInitiated event,
    Emitter<SearchState> emit,
  ) async {
    await _getTask(
      emit: emit,
      isInitialLoad: true,
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(
        state.copyWith(
          isShimmerLoading: false,
        ),
      ),
    );
  }

  FutureOr<void> _onSearchPageLoadMore(
    SearchPageLoadMore event,
    Emitter<SearchState> emit,
  ) {
    _getTask(emit: emit, isInitialLoad: false);
  }

  Future<FutureOr<void>> _onSearchPageRefreshed(
    SearchPageRefreshed event,
    Emitter<SearchState> emit,
  ) async {
    await _getTask(
      emit: emit,
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

  Future<void> _getTask({
    required Emitter<SearchState> emit,
    required bool isInitialLoad,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      action: () async {
        // final output = List.generate(20, (index) => Task(id: index.toString()));
        // emit(state.copyWith(tasks: LoadMoreOutput<Task>(data: output)));
      },
      doOnError: (e) async {
        emit(state.copyWith(loadTaskException: e));
      },
      doOnSubscribe: doOnSubscribe,
      doOnSuccessOrError: doOnSuccessOrError,
      handleLoading: false,
    );
  }
}
