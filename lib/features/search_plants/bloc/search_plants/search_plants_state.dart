part of 'search_plants_bloc.dart';

class SearchPlantsState extends BaseBlocState with EquatableMixin {
  SearchPlantsState({
    this.plantDatas = const LoadMoreOutput(data: []),
    this.isShimmerLoading = false,
    this.loadTaskException,
    this.hasFilter = false,
    this.plantSearchRequest,
  });

  final LoadMoreOutput<PlantSearchResponse> plantDatas;
  final bool isShimmerLoading;
  final AppException? loadTaskException;
  final bool hasFilter;
  final PlantSearchRequest? plantSearchRequest;

  @override
  List<Object?> get props => [
        plantDatas,
        isShimmerLoading,
        loadTaskException,
        hasFilter,
        plantSearchRequest
      ];

  SearchPlantsState copyWith({
    LoadMoreOutput<PlantSearchResponse>? plantDatas,
    bool? isShimmerLoading,
    AppException? loadTaskException,
    bool? hasFilter,
    PlantSearchRequest? plantSearchRequest,
  }) {
    return SearchPlantsState(
      plantDatas: plantDatas ?? this.plantDatas,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
      loadTaskException: loadTaskException ?? this.loadTaskException,
      hasFilter: hasFilter ?? this.hasFilter,
      plantSearchRequest: plantSearchRequest ?? this.plantSearchRequest,
    );
  }
}
