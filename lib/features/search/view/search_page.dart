import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:botanic_gaze/features/search/index.dart';
import 'package:botanic_gaze/models/index.dart';
import 'package:botanic_gaze/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:paging_view/paging_view.dart';
import 'package:shared/shared.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  late final _pagingController = CommonPagingController<PlantSearchResponse>()
    ..disposeBy(disposeBag);

  @override
  void initState() {
    super.initState();
    bloc.add(SearchPageInitiated());
    _pagingController.listen(
      onLoadMore: () => bloc.add(SearchPageLoadMore()),
    );
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchBloc, SearchState>(
          listenWhen: (previous, current) => previous.tasks != current.tasks,
          listener: (context, state) {
            _pagingController.appendLoadMoreOutput(state.tasks);
          },
        ),
        BlocListener<SearchBloc, SearchState>(
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
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) =>
              previous.tasks != current.tasks ||
              previous.isShimmerLoading != current.isShimmerLoading,
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () {
                final completer = Completer<void>();
                bloc.add(SearchPageRefreshed(completer: completer));

                return completer.future;
              },
              child: state.isShimmerLoading && state.tasks.data.isNullOrEmpty
                  ? const _ListViewLoader()
                  : CommonPagedListView(
                      pagingController: _pagingController,
                      itemBuilder: (context, user, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimens.d8.responsive(),
                            vertical: Dimens.d4.responsive(),
                          ),
                          child: ShimmerLoading(
                            isLoading: state.isShimmerLoading,
                            loadingWidget: const _LoadingItem(),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(
                                  Dimens.d8.responsive(),
                                ),
                              ),
                              width: double.infinity,
                              height: Dimens.d60.responsive(),
                              child: Text(
                                index.toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                                // style: AppTextStyles.s14w400Primary(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _LoadingItem extends StatelessWidget {
  const _LoadingItem();

  @override
  Widget build(BuildContext context) {
    return RoundRectangleShimmer(
      width: double.infinity,
      height: Dimens.d60.responsive(),
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
