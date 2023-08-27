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
class AnalysisImageBlocBloc
    extends BaseBloc<AnalysisImageBlocEvent, AnalysisImageBlocState> {
  AnalysisImageBlocBloc() : super(AnalysisImageBlocState()) {
    on<AnalyzingImage>(_onAnalyzingImage);
  }

  Future<void> _onAnalyzingImage(
    AnalyzingImage event,
    Emitter<AnalysisImageBlocState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final output = await getIt<AppApiService>().identifyPlant(event.file);
        emit(state.copyWith(identifyData: output.data));
      },
      doOnError: (e) async => emit(state.copyWith(isAnalyzing: false)),
      doOnSubscribe: () async => emit(state.copyWith(isAnalyzing: false)),
      doOnSuccessOrError: () async => emit(state.copyWith(isAnalyzing: true)),
      handleLoading: false,
      handleRetry: false,
    );
  }
}
