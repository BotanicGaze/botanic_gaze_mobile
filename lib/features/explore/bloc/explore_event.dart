part of 'explore_bloc.dart';

sealed class ExploreEvent extends BaseBlocEvent with EquatableMixin {
  const ExploreEvent();

  // @override
  // List<Object> get props => [];
}

class GetWeatherData extends ExploreEvent {
  @override
  List<Object?> get props => [];
}

class GetFlowerOfSeason extends ExploreEvent {
  @override
  List<Object?> get props => [];
}

class PopularPlantInit extends ExploreEvent {
  PopularPlantInit({required this.page});
  final int page;

  @override
  List<Object?> get props => [page];
}

class PopularPlantLoadMore extends ExploreEvent {
  PopularPlantLoadMore({required this.page});
  final int page;

  @override
  List<Object?> get props => [page];
}

class PopularPlantRefreshed extends ExploreEvent {
  PopularPlantRefreshed({
    required this.completer,
    required this.page,
  });

  final Completer<void> completer;
  final int page;

  @override
  List<Object?> get props => [completer, page];
}
