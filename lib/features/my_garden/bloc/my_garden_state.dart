part of 'my_garden_bloc.dart';

class MyGardenState extends BaseBlocState with EquatableMixin {
  const MyGardenState({
    this.myPlants = const LoadMoreOutput(data: []),
    this.exception,
    this.isShimmerLoading = false,
  });

  final LoadMoreOutput<MyPlantModel> myPlants;
  final bool isShimmerLoading;

  final AppException? exception;

  @override
  List<Object?> get props => [myPlants, exception, isShimmerLoading];

  MyGardenState copyWith({
    LoadMoreOutput<MyPlantModel>? myPlants,
    bool? isShimmerLoading,
    AppException? exception,
  }) {
    return MyGardenState(
      myPlants: myPlants ?? this.myPlants,
      isShimmerLoading: isShimmerLoading ?? this.isShimmerLoading,
      exception: exception,
    );
  }
}
