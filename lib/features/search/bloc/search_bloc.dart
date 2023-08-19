import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

@Injectable()
class SearchBloc extends BaseBloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
