part of 'analysis_image_bloc.dart';

sealed class AnalysisImageBlocEvent extends BaseBlocEvent with EquatableMixin {
  const AnalysisImageBlocEvent();
}

class AnalyzingImage extends AnalysisImageBlocEvent {
  AnalyzingImage(this.file);

  final File file;
  @override
  List<Object?> get props => [file];
}
