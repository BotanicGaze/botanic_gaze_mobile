import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

class SearchPlantsPage extends StatefulWidget {
  const SearchPlantsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPlantsPageState();
  }
}

class _SearchPlantsPageState
    extends BasePageState<SearchPlantsPage, SearchPlantsBloc> {
  late final _pagingController = CommonPagingController<PlantSearchResponse>()
    ..disposeBy(disposeBag);
  late PlantSearchRequest plantsRequest;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    plantsRequest = const PlantSearchRequest();
    bloc.add(SearchPageInitiated(request: plantsRequest));
    _pagingController.listen(
      onLoadMore: (pageKey) => bloc.add(
        SearchPageLoadMore(request: plantsRequest.copyWith(page: pageKey)),
      ),
    );
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchPlantsBloc, SearchPlantsState>(
          listenWhen: (previous, current) =>
              previous.plantDatas != current.plantDatas,
          listener: (context, state) {
            _pagingController.appendLoadMoreOutput(state.plantDatas);
          },
        ),
        BlocListener<SearchPlantsBloc, SearchPlantsState>(
          listenWhen: (previous, current) =>
              previous.loadTaskException != current.loadTaskException,
          listener: (context, state) {
            _pagingController.error = state.loadTaskException;
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      extendBody: true,
      appBar: AppBar(
        leading: const CloseButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text('Search plants'),
      ),
      otherBackground: otherBackground(),
      body: AppSafeArea(
        child: BlocBuilder<SearchPlantsBloc, SearchPlantsState>(
          buildWhen: (previous, current) =>
              previous.plantDatas != current.plantDatas ||
              previous.isShimmerLoading != current.isShimmerLoading,
          builder: (context, state) {
            return Column(
              children: [
                _buildSearchField(),
                _buildSearchResult(state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchResult(SearchPlantsState state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: state.isShimmerLoading && state.plantDatas.data.isNullOrEmpty
            ? const _ListViewLoader()
            : CommonPagedListView(
                animateTransitions: false,
                pagingController: _pagingController,
                noItemsFoundIndicator: NoItemsFoundIndicator(
                  searchKeyword: _searchController.text.trim(),
                ),
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
              ),
      ),
    );
  }

  Future<void> _onRefresh() {
    final completer = Completer<void>();
    plantsRequest = plantsRequest.copyWith(page: 1);
    bloc.add(
      SearchPageRefreshed(
        completer: completer,
        request: plantsRequest,
      ),
    );

    return completer.future;
  }

  Widget _buildSearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.d16.responsive(),
      ).copyWith(bottom: Dimens.d12.responsive()),
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              hintText: 'Search plants',
              textInputAction: TextInputAction.search,
              controller: _searchController,
              onClear: () {
                plantsRequest = plantsRequest.copyWith(page: 1, q: '');
                bloc.add(
                  SearchTextFieldChanged(request: plantsRequest),
                );
              },
              onChanged: (value) {
                plantsRequest = plantsRequest.copyWith(page: 1, q: value);
                bloc.add(
                  SearchTextFieldChanged(request: plantsRequest),
                );
              },
              prefixIcon: Hero(
                tag: AppIcons.iconSearch,
                child: Image.asset(
                  AppIcons.iconSearch,
                  width: Dimens.d20.responsive(),
                ),
              ),
            ),
          ),
          SizedBox(width: Dimens.d8.responsive()),
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.d12.responsive()),
            child: BlocBuilder<SearchPlantsBloc, SearchPlantsState>(
              builder: (context, state) {
                final isActive = state.hasFilter;
                final color = isActive ? Theme.of(context).primaryColor : null;
                return Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    IconButton.outlined(
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.d12.responsive()),
                        ),
                        side: isActive
                            ? BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: Dimens.d2.responsive(),
                              )
                            : null,
                      ),
                      onPressed: () async {
                        final result = await context.pushNamed(
                          NavigationContains.searchPlantsFilterPage,
                          extra: {
                            'init_filter': SearchPlantsFilter(
                              sunlightSelected: SunlightX.dataFromId(
                                state.plantSearchRequest?.sunlight ?? [],
                              ),
                              soilTypeSelected: SoilTypeX.dataFromId(
                                state.plantSearchRequest?.soilType ?? [],
                              ),
                              seasonOfInterestSelected:
                                  SeasonOfInterestX.dataFromId(
                                state.plantSearchRequest?.seasonOfInterest ??
                                    [],
                              ),
                              plantTypesSelected: PlantTypesX.dataFromId(
                                state.plantSearchRequest?.plantTypes ?? [],
                              ),
                            ),
                          },
                        );
                        if (result != null && result is SearchPlantsFilter) {
                          plantsRequest = plantsRequest.copyWith(
                            page: 1,
                            q: _searchController.text.trim(),
                            sunlight: result.sunlightSelected
                                .map((e) => e.id)
                                .toList(),
                            soilType: result.soilTypeSelected
                                .map((e) => e.id)
                                .toList(),
                            seasonOfInterest: result.seasonOfInterestSelected
                                .map((e) => e.id)
                                .toList(),
                            plantTypes: result.plantTypesSelected
                                .map((e) => e.id)
                                .toList(),
                          );
                          bloc.add(
                            ApplyFilter(
                              request: plantsRequest,
                              hasFilter: result.hasFilter,
                            ),
                          );
                        }
                      },
                      icon: Image.asset(
                        AppIcons.iconFilter,
                        color: color,
                      ),
                    ),
                    Visibility(
                      visible: isActive,
                      child: Container(
                        width: Dimens.d15.responsive(),
                        height: Dimens.d15.responsive(),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            color: Theme.of(context).cardColor,
                            width: Dimens.d3.responsive(),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> otherBackground() {
    return [
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.imageBackground1,
          width: ScreenUtil().screenHeight * 0.2,
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            AppImages.imageBackground2,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Opacity(
          opacity: 0.4,
          child: Image.asset(
            AppImages.imageBackground3,
            width: ScreenUtil().screenHeight * 0.2,
          ),
        ),
      )
    ];
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
    return ListView.builder(
      itemCount: UiConstants.shimmerItemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.d8.responsive(),
          vertical: Dimens.d4.responsive(),
        ),
        child: const ShimmerLoading(
          loadingWidget: _LoadingItem(),
          isLoading: true,
          child: _LoadingItem(),
        ),
      ),
    );
  }
}
