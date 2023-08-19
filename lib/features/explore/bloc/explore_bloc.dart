import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

@Injectable()
class ExploreBloc extends BaseBloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(const ExploreState()) {
    on<ExploreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
