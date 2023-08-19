part of 'scan_bloc.dart';

sealed class ScanEvent extends BaseBlocEvent with EquatableMixin {
  const ScanEvent();

  @override
  List<Object> get props => [];
}
