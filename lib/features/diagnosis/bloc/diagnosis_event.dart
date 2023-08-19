part of 'diagnosis_bloc.dart';

sealed class DiagnosisEvent extends BaseBlocEvent with EquatableMixin {
  const DiagnosisEvent();

  @override
  List<Object> get props => [];
}
