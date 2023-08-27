import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/search_plants/index.dart';
import 'package:botanic_gaze/models/index.dart';
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.d16.responsive(),
                  ).copyWith(bottom: Dimens.d12.responsive()),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: 'Search plants',
                          textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            plantsRequest =
                                plantsRequest.copyWith(page: 1, q: value);
                            bloc.add(
                              SearchTextFieldChanged(
                                request: plantsRequest,
                              ),
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
                      IconButton.outlined(
                        onPressed: () {},
                        icon: Image.asset(AppIcons.iconFilter),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      final completer = Completer<void>();
                      plantsRequest = plantsRequest.copyWith(page: 1);
                      bloc.add(
                        SearchPageRefreshed(
                          completer: completer,
                          request: plantsRequest,
                        ),
                      );

                      return completer.future;
                    },
                    child: state.isShimmerLoading &&
                            state.plantDatas.data.isNullOrEmpty
                        ? const _ListViewLoader()
                        : CommonPagedListView(
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
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimens.d16.responsive(),
                                      vertical: Dimens.d8.responsive(),
                                    ),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          CachedImageWidget(
                                            imageUrl:
                                                'https://apps.rhs.org.uk/plantselectorimages/detail/${plantData.image}',
                                            width: Dimens.d75.responsive(),
                                            height: Dimens.d75.responsive(),
                                            fit: BoxFit.cover,
                                            borderRadius: BorderRadius.circular(
                                              Dimens.d6.responsive(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimens.d12.responsive(),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  (plantData.botanicalName ??
                                                          '')
                                                      .parseHtmlString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  (plantData.entityDescription ??
                                                          '')
                                                      .parseHtmlString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimens.d12.responsive(),
                                          ),
                                          Image.asset(
                                            AppIcons.iconChevronRight,
                                            width: Dimens.d24.responsive(),
                                            height: Dimens.d24.responsive(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            );
          },
        ),
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

class PlantTypeView extends StatelessWidget {
  const PlantTypeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 174 / 100,
      mainAxisSpacing: Dimens.d16.responsive(),
      crossAxisSpacing: Dimens.d16.responsive(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.d16.responsive(),
      ),
      children: List.generate(PlantTypes.values.length, (index) {
        return Stack(
          children: [
            Image.asset(
              PlantTypes.values[index].imagePath,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Dimens.d24.responsive(),
                bottom: Dimens.d24.responsive(),
                left: Dimens.d12.responsive(),
                right: Dimens.d24.responsive(),
              ),
              child: Text(
                PlantTypes.values[index].title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        );
      }),
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
