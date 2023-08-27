part of 'search_bloc.dart';

sealed class SearchEvent extends BaseBlocEvent with EquatableMixin {
  const SearchEvent();
}

class SearchPageInitiated extends SearchEvent {
  SearchPageInitiated({required this.request});

  final PlantSearchRequest request;
  @override
  List<Object?> get props => [request];
}

class SearchPageLoadMore extends SearchEvent {
  SearchPageLoadMore({required this.request});

  final PlantSearchRequest request;

  @override
  List<Object?> get props => [request];
}

class SearchPageRefreshed extends SearchEvent {
  SearchPageRefreshed({
    required this.completer,
    required this.request,
  });

  final Completer<void> completer;
  final PlantSearchRequest request;

  @override
  List<Object?> get props => [completer, request];
}

class SearchTextFieldChanged extends SearchEvent {
  SearchTextFieldChanged({
    required this.request,
  });

  final PlantSearchRequest request;

  @override
  List<Object?> get props => [request];
}
