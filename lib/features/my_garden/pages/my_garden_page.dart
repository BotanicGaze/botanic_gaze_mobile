import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:base_network/base_network.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:botanic_gaze/features/my_garden/index.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/navigation/index.dart';
import 'package:botanic_gaze/services/global_callback.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

class MyGardenPage extends StatefulWidget {
  const MyGardenPage({super.key});

  @override
  State<MyGardenPage> createState() => _MyGardenPageState();
}

class _MyGardenPageState extends BasePageState<MyGardenPage, MyGardenBloc> {
  late final _pagingController = CommonPagingController<MyPlantModel>()
    ..disposeBy(disposeBag);

  final int initPage = PagingConstants.initialPage;
  final int perPage = 20;

  @override
  void initState() {
    super.initState();
    getIt<GlobalCallback>().onAddMyPlantSuccess = _pagingController.refresh;
    bloc.add(
      GetMyPlant(page: _pagingController.firstPageKey, perPage: perPage),
    );
    _pagingController.listen(
      onLoadMore: (pageKey) => bloc.add(GetMyPlantLoadMore(page: pageKey)),
      // onRefresh: _onRefresh,
    );
    // _onRefresh();
  }

  @override
  void dispose() {
    getIt<GlobalCallback>().onAddMyPlantSuccess = null;
    super.dispose();
  }

  Future<void> _onRefresh() async {
    final completer = Completer<void>();
    bloc.add(
      GetMyPlantRefreshed(
        page: _pagingController.firstPageKey,
        perPage: perPage,
        completer: completer,
      ),
    );
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MyGardenBloc, MyGardenState>(
          listenWhen: (previous, current) =>
              previous.myPlants != current.myPlants,
          listener: (context, state) {
            _pagingController.appendLoadMoreOutput(state.myPlants);
          },
        ),
        BlocListener<MyGardenBloc, MyGardenState>(
          listenWhen: (previous, current) =>
              previous.exception != current.exception,
          listener: (context, state) {
            _pagingController.error = state.exception;
          },
        ),
        BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) =>
              previous.userInfo != current.userInfo,
          listener: (context, state) {
            _pagingController.refresh();
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: const Text('My plant'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Dimens.d16.responsive()),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(NavigationContains.searchPage);
                    },
                    child: AppTextField(
                      hintText: 'Monstera Albo',
                      enabled: false,
                      prefixIcon: Image.asset(
                        AppIcons.iconSearch,
                        width: Dimens.d16.responsive(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimens.d8.responsive()),
                SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(NavigationContains.scanPage);
                    },
                    child: SizedBox(
                      // width: Dimens.d50.responsive(),
                      child: IconButton.filled(
                        onPressed: () {},
                        icon: Image.asset(
                          AppIcons.iconCamera,
                          // width: Dimens.d64.responsive(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: BlocBuilder<MyGardenBloc, MyGardenState>(
                builder: (context, state) {
                  if (state.isShimmerLoading) return const _ListViewLoader();
                  return CommonPagedListView(
                    pagingController: _pagingController,
                    // firstPageProgressIndicator: const _LoadingItem(),
                    firstPageErrorIndicator: MyPlantEmptyView(
                      error: state.exception as RemoteException?,
                      pagingController: _pagingController,
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: Dimens.d8.responsive(),
                      );
                    },
                    itemBuilder:
                        (BuildContext context, MyPlantModel item, int index) {
                      return MyPlantItemWidget(
                        item: item,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
      shrinkWrap: true,
      primary: false,
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
