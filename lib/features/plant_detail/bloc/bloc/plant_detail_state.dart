part of 'plant_detail_bloc.dart';

class PlantDetailState extends BaseBlocState with EquatableMixin {
  const PlantDetailState({this.plantDetailModel});

  final PlantDetailModel? plantDetailModel;

  @override
  List<Object?> get props => [plantDetailModel];

  PlantDetailState copyWith({
    PlantDetailModel? plantDetailModel,
  }) {
    return PlantDetailState(
      plantDetailModel: plantDetailModel ?? this.plantDetailModel,
    );
  }
}
