part of 'popular_plant_detail_bloc.dart';

sealed class PopularPlantListDetailEvent extends BaseBlocEvent
    with EquatableMixin {
  const PopularPlantListDetailEvent();
}

class ListInitiated extends PopularPlantListDetailEvent {
  ListInitiated({
    required this.plantNames,
  });

  final String plantNames;

  @override
  List<Object?> get props => [plantNames];
}

class ListLoadMore extends PopularPlantListDetailEvent {
  ListLoadMore({
    required this.plantNames,
    required this.page,
  });

  final String plantNames;
  final int page;

  @override
  List<Object?> get props => [plantNames, page];
}
