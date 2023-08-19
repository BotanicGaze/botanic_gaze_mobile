import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'scan_event.dart';
part 'scan_state.dart';

@Injectable()
class ScanBloc extends BaseBloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanState()) {
    on<ScanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
