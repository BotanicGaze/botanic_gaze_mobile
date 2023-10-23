part of 'my_garden_bloc.dart';

sealed class MyGardenEvent extends BaseBlocEvent with EquatableMixin {
  const MyGardenEvent();
}

class GetMyPlant extends MyGardenEvent {
  GetMyPlant({this.page = 1, this.perPage = 20});

  final int page;
  final int perPage;

  @override
  List<Object?> get props => [page, perPage];
}

class GetMyPlantLoadMore extends MyGardenEvent {
  GetMyPlantLoadMore({required this.page, this.perPage = 20});

  final int page;
  final int perPage;

  @override
  List<Object?> get props => [page, perPage];
}
