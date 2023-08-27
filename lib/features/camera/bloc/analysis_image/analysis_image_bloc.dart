import 'dart:async';
import 'dart:io';

import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/data_source/app_api_service.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:shared/shared.dart';

part 'analysis_image_event.dart';
part 'analysis_image_state.dart';

@Injectable()
class AnalysisImageBloc
    extends BaseBloc<AnalysisImageEvent, AnalysisImageState> {
  AnalysisImageBloc() : super(AnalysisImageState()) {
    on<AnalyzingImage>(_onAnalyzingImage);
  }

  Future<void> _onAnalyzingImage(
    AnalyzingImage event,
    Emitter<AnalysisImageState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().identifyPlant(event.file);
        emit(state.copyWith(identifyData: output.data));
      },
      doOnError: (e) async => emit(state.copyWith()),
      doOnSubscribe: () async => emit(state.copyWith()),
      doOnSuccessOrError: () async => emit(state.copyWith()),
      handleLoading: false,
      handleRetry: false,
    );
  }
}
