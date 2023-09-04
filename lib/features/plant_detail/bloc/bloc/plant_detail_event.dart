part of 'plant_detail_bloc.dart';

sealed class PlantDetailEvent extends BaseBlocEvent with EquatableMixin {
  const PlantDetailEvent();
}

class GetPlantDetail extends PlantDetailEvent {
  GetPlantDetail(this.plantId);

  final int plantId;
  @override
  List<Object?> get props => [plantId];
}
