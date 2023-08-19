import 'package:base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'search_tab_event.dart';
part 'search_tab_state.dart';

@Injectable()
class SearchTabBloc extends BaseBloc<SearchTabEvent, SearchTabState> {
  SearchTabBloc() : super(const SearchTabState()) {
    on<SearchTabEvent>((event, emit) {});
  }
}
