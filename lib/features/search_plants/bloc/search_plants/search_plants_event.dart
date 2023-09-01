part of 'search_plants_bloc.dart';

sealed class SearchPlantsEvent extends BaseBlocEvent with EquatableMixin {
  const SearchPlantsEvent();
}

class SearchPageInitiated extends SearchPlantsEvent {
  SearchPageInitiated({required this.request});

  final PlantSearchRequest request;
  @override
  List<Object?> get props => [request];
}

class SearchPageLoadMore extends SearchPlantsEvent {
  SearchPageLoadMore({required this.request});

  final PlantSearchRequest request;

  @override
  List<Object?> get props => [request];
}

class SearchPageRefreshed extends SearchPlantsEvent {
  SearchPageRefreshed({
    required this.completer,
    required this.request,
  });

  final Completer<void> completer;
  final PlantSearchRequest request;

  @override
  List<Object?> get props => [completer, request];
}

class SearchTextFieldChanged extends SearchPlantsEvent {
  SearchTextFieldChanged({
    required this.request,
  });

  final PlantSearchRequest request;

  @override
  List<Object?> get props => [request];
}

class ApplyFilter extends SearchPlantsEvent {
  ApplyFilter({
    required this.request,
    required this.hasFilter,
  });

  final PlantSearchRequest request;
  final bool hasFilter;

  @override
  List<Object?> get props => [request, hasFilter];
}
