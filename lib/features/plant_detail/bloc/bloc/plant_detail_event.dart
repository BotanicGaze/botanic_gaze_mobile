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

class GetPlantNetDetail extends PlantDetailEvent {
  GetPlantNetDetail(this.plantNetName);

  final String plantNetName;

  @override
  List<Object?> get props => [plantNetName];
}
