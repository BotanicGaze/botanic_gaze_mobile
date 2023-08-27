part of 'analysis_image_bloc.dart';

sealed class AnalysisImageEvent extends BaseBlocEvent with EquatableMixin {
  const AnalysisImageEvent();
}

class AnalyzingImage extends AnalysisImageEvent {
  AnalyzingImage(this.file);

  final File file;
  @override
  List<Object?> get props => [file];
}
