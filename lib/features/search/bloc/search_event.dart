part of 'search_bloc.dart';

sealed class SearchEvent extends BaseBlocEvent with EquatableMixin {
  const SearchEvent();
}

class SearchPageInitiated extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchPageLoadMore extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchPageRefreshed extends SearchEvent {
  SearchPageRefreshed({required this.completer});

  final Completer<void> completer;

  @override
  List<Object?> get props => [];
}
