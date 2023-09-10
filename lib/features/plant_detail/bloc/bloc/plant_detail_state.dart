part of 'plant_detail_bloc.dart';

class PlantDetailState extends BaseBlocState with EquatableMixin {
  const PlantDetailState({
    this.plantDetailModel,
    // this.plantNetImages,
  });

  final PlantDetailModel? plantDetailModel;
  // final PlantNetImages? plantNetImages;

  @override
  List<Object?> get props => [plantDetailModel];

  PlantDetailState copyWith({
    PlantDetailModel? plantDetailModel,
    // PlantNetImages? plantNetImages,
  }) {
    return PlantDetailState(
      plantDetailModel: plantDetailModel ?? this.plantDetailModel,
      // plantNetImages: plantNetImages ?? this.plantNetImages,
    );
  }
}
