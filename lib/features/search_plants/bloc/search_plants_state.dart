part of 'search_plants_bloc.dart';

class SearchPlantsState extends BaseBlocState with EquatableMixin {
  SearchPlantsState({
    this.plantDatas = const LoadMoreOutput(data: []),
    this.isShimmerLoading = false,
    this.loadTaskException,
  });

  final LoadMoreOutput<PlantSearchResponse> plantDatas;
  final bool isShimmerLoading;
  final AppException? loadTaskException;

  @override
  List<Object?> get props => [plantDatas, isShimmerLoading, loadTaskException];

  SearchPlantsState copyWith({
    LoadMoreOutput<PlantSearchResponse>? plantDatas,
    bool? isShimmerLoading,
    AppException? loadTaskException,
  }) {
    return SearchPlantsState(
      plantDatas: plantDatas ?? this.plantDatas,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
      loadTaskException: loadTaskException ?? this.loadTaskException,
    );
  }
}
