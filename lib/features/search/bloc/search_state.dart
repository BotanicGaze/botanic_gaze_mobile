part of 'search_bloc.dart';

class SearchState extends BaseBlocState with EquatableMixin {
  SearchState({
    this.plantDatas = const LoadMoreOutput(data: []),
    this.isShimmerLoading = false,
    this.loadTaskException,
  });

  final LoadMoreOutput<PlantSearchResponse> plantDatas;
  final bool isShimmerLoading;
  final AppException? loadTaskException;

  @override
  List<Object?> get props => [plantDatas, isShimmerLoading, loadTaskException];

  SearchState copyWith({
    LoadMoreOutput<PlantSearchResponse>? plantDatas,
    bool? isShimmerLoading,
    AppException? loadTaskException,
  }) {
    return SearchState(
      plantDatas: plantDatas ?? this.plantDatas,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
      loadTaskException: loadTaskException ?? this.loadTaskException,
    );
  }
}
