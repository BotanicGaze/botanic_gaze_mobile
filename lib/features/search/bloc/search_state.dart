part of 'search_bloc.dart';

class SearchState extends BaseBlocState with EquatableMixin {
  SearchState({
    this.tasks = const LoadMoreOutput(data: []),
    this.isShimmerLoading = false,
    this.loadTaskException,
  });

  final LoadMoreOutput<PlantSearchResponse> tasks;
  final bool isShimmerLoading;
  final AppException? loadTaskException;

  @override
  List<Object?> get props => [tasks, isShimmerLoading, loadTaskException];

  SearchState copyWith({
    LoadMoreOutput<PlantSearchResponse>? tasks,
    bool? isShimmerLoading,
    AppException? loadTaskException,
  }) {
    return SearchState(
      tasks: tasks ?? this.tasks,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
      loadTaskException: loadTaskException ?? this.loadTaskException,
    );
  }
}
