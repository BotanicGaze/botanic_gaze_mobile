import 'dart:async';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

part 'my_garden_event.dart';
part 'my_garden_state.dart';

@Injectable()
class MyGardenBloc extends BaseBloc<MyGardenEvent, MyGardenState> {
  MyGardenBloc() : super(const MyGardenState()) {
    on<GetMyPlant>(_onGetMyPlant);
    on<GetMyPlantLoadMore>(_onGetMyPlantLoadMore);
  }

  Future<void> _onGetMyPlant(
    GetMyPlant event,
    Emitter<MyGardenState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>()
            .getMyPlant(page: event.page, perPage: event.perPage);
        emit(
          state.copyWith(
            myPlants: LoadMoreOutput(
              data: output.data,
              isRefreshSuccess: true,
              page: event.page,
              isLastPage: output.data.length < event.perPage,
            ),
          ),
        );
      },
      // doOnSubscribe: () async => emit(
      //   state.copyWith(isShimmerLoading: true),
      // ),
      // doOnSuccessOrError: () async => emit(
      //   state.copyWith(isShimmerLoading: false),
      // ),
      doOnError: (e) async {
        Log.e(e);
        emit(
          state.copyWith(
            exception: e,
          ),
        );
      },
      handleLoading: false,
    );
  }

  Future<void> _onGetMyPlantLoadMore(
    GetMyPlantLoadMore event,
    Emitter<MyGardenState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>()
            .getMyPlant(page: event.page, perPage: event.perPage);
        emit(
          state.copyWith(
            myPlants: LoadMoreOutput<MyPlantModel>(
              data: output.data,
              page: event.page,
              isLastPage: output.data.isEmpty,
            ),
          ),
        );
      },
      // doOnSubscribe: () async => emit(
      //   state.copyWith(isShimmerLoading: true),
      // ),
      // doOnSuccessOrError: () async => emit(
      //   state.copyWith(isShimmerLoading: false),
      // ),
      doOnError: (e) async {
        emit(
          state.copyWith(
            exception: e,
          ),
        );
      },
      handleLoading: false,
      handleRetry: false,
    );
  }
}
