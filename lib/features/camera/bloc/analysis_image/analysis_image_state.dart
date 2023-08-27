part of 'analysis_image_bloc.dart';

class AnalysisImageBlocState extends BaseBlocState with EquatableMixin {
  AnalysisImageBlocState({
    this.identifyData,
    this.isAnalyzing = true,
  });

  final PlantIdentifyModel? identifyData;
  final bool isAnalyzing;

  @override
  List<Object?> get props => [identifyData, isAnalyzing];

  AnalysisImageBlocState copyWith({
    PlantIdentifyModel? identifyData,
    bool? isAnalyzing,
  }) {
    return AnalysisImageBlocState(
      identifyData: identifyData ?? this.identifyData,
      isAnalyzing: isAnalyzing ?? this.isAnalyzing,
    );
  }
}
