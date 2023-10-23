part of 'plant_detail_bloc.dart';

class PlantDetailState extends BaseBlocState with EquatableMixin {
  const PlantDetailState({
    this.plantDetailModel,
    this.exception,
  });

  final PlantDetailModel? plantDetailModel;
  final AppException? exception;

  @override
  List<Object?> get props => [plantDetailModel, exception];

  PlantDetailState copyWith({
    PlantDetailModel? plantDetailModel,
    AppException? exception,
  }) {
    return PlantDetailState(
      plantDetailModel: plantDetailModel ?? this.plantDetailModel,
      exception: exception,
    );
  }
}
