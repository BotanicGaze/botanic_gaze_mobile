part of 'analysis_image_bloc.dart';

class AnalysisImageState extends BaseBlocState with EquatableMixin {
  AnalysisImageState({
    this.identifyData,
  });

  final PlantIdentifyModel? identifyData;

  @override
  List<Object?> get props => [identifyData];

  AnalysisImageState copyWith({
    PlantIdentifyModel? identifyData,
  }) {
    return AnalysisImageState(
      identifyData: identifyData ?? this.identifyData,
    );
  }
}
