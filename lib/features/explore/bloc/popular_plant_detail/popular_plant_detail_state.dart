part of 'popular_plant_detail_bloc.dart';

class PopularPlantListDetailState extends BaseBlocState with EquatableMixin {
  const PopularPlantListDetailState({
    this.plantDatas = const LoadMoreOutput(data: []),
    this.isShimmerLoading = false,
  });

  final LoadMoreOutput<PlantSearchResponse> plantDatas;
  final bool isShimmerLoading;

  @override
  List<Object> get props => [plantDatas, isShimmerLoading];

  PopularPlantListDetailState copyWith({
    LoadMoreOutput<PlantSearchResponse>? plantDatas,
    bool? isShimmerLoading,
  }) {
    return PopularPlantListDetailState(
      plantDatas: plantDatas ?? this.plantDatas,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
    );
  }
}
