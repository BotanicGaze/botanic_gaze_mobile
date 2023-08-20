import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'diagnosis_event.dart';
part 'diagnosis_state.dart';

@Injectable()
class DiagnosisBloc extends BaseBloc<DiagnosisEvent, DiagnosisState> {
  DiagnosisBloc() : super(const DiagnosisState()) {
    on<DiagnosisEvent>((event, emit) {});
  }
}
