import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/explore/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:flutter/material.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

class PopularPlantListDetailView extends StatefulWidget {
  const PopularPlantListDetailView({required this.plantNames, super.key});

  final String plantNames;

  @override
  State<PopularPlantListDetailView> createState() =>
      _PopularPlantListDetailViewState();
}

class _PopularPlantListDetailViewState
    extends State<PopularPlantListDetailView> {
  late final _pagingController = CommonPagingController<PlantSearchResponse>();
  // ..disposeBy(disposeBag);

  @override
  void initState() {
    super.initState();

    context.read<PopularPlantListDetailBloc>().add(
          ListInitiated(
            plantNames: widget.plantNames,
          ),
        );
    _pagingController.listen(
      onLoadMore: (pageKey) => context.read<PopularPlantListDetailBloc>().add(
            ListLoadMore(
              plantNames: widget.plantNames,
              page: pageKey,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularPlantListDetailBloc,
        PopularPlantListDetailState>(
      listenWhen: (previous, current) =>
          previous.plantDatas != current.plantDatas,
      listener: (context, state) {
        _pagingController.appendLoadMoreOutput(state.plantDatas);
      },
      builder: (context, state) {
        return state.isShimmerLoading && state.plantDatas.data.isNullOrEmpty
            ? const _ListViewLoader()
            : CommonPagedSliverList(
                animateTransitions: false,
                pagingController: _pagingController,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: Dimens.d4.responsive(),
                  );
                },
                itemBuilder: (context, plantData, index) {
                  return ShimmerLoading(
                    isLoading: state.isShimmerLoading,
                    loadingWidget: const _LoadingItem(),
                    child: PlantItemWidget(plantData: plantData),
                  );
                },
              );
      },
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.d16.responsive()),
      child: RoundRectangleShimmer(
        width: double.infinity,
        height: Dimens.d75.responsive(),
      ),
    );
  }
}

/// Because [PagedListView] does not expose the [itemCount] property,
/// itemCount = 0 on the first load
/// and thus the Shimmer loading effect can not work.
/// We need to create a fake ListView for the first load.
class _ListViewLoader extends StatelessWidget {
  const _ListViewLoader();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.d4.responsive(),
            ),
            child: const ShimmerLoading(
              loadingWidget: _LoadingItem(),
              isLoading: true,
              child: _LoadingItem(),
            ),
          );
        },
        childCount: UiConstants.shimmerItemCount,
      ),
    );
  }
}
