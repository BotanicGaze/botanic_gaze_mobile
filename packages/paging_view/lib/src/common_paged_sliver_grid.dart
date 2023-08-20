import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paging_view/src/controller/common_paging_controller.dart';
import 'package:paging_view/src/paging_constants.dart';
import 'package:paging_view/src/paging_view_config.dart';

class CommonPagedSliverGrid<T> extends StatelessWidget {
  const CommonPagedSliverGrid({
    required this.pagingController,
    required this.itemBuilder,
    required this.gridDelegate,
    this.animateTransitions = true,
    this.transitionDuration = PagingConstants.defaultListGridTransitionDuration,
    this.firstPageErrorIndicator,
    this.newPageErrorIndicator,
    this.firstPageProgressIndicator,
    this.newPageProgressIndicator,
    this.noItemsFoundIndicator,
    this.noMoreItemsIndicator,
    super.key,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.showNewPageProgressIndicatorAsGridChild = false,
    this.showNewPageErrorIndicatorAsGridChild = false,
    this.showNoMoreItemsIndicatorAsGridChild = false,
    this.shrinkWrapFirstPageIndicators = false,
  });

  final CommonPagingController<T> pagingController;
  final Widget Function(
    BuildContext context,
    T item,
    int index,
  ) itemBuilder;
  final bool animateTransitions;
  final Duration transitionDuration;
  final Widget? firstPageErrorIndicator;
  final Widget? newPageErrorIndicator;
  final Widget? firstPageProgressIndicator;
  final Widget? newPageProgressIndicator;
  final Widget? noItemsFoundIndicator;
  final Widget? noMoreItemsIndicator;

  final SliverGridDelegate gridDelegate;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final bool showNewPageProgressIndicatorAsGridChild;
  final bool showNewPageErrorIndicatorAsGridChild;
  final bool showNoMoreItemsIndicatorAsGridChild;
  final bool shrinkWrapFirstPageIndicators;

  @override
  Widget build(BuildContext context) {
    final builderDelegate = PagedChildBuilderDelegate<T>(
      itemBuilder: itemBuilder,
      animateTransitions: animateTransitions,
      transitionDuration: transitionDuration,
      firstPageErrorIndicatorBuilder: firstPageErrorIndicator != null
          ? (_) => firstPageErrorIndicator!
          : PagingViewConfig.instance.firstPageErrorIndicatorBuilder,
      newPageErrorIndicatorBuilder: newPageErrorIndicator != null
          ? (_) => newPageErrorIndicator!
          : PagingViewConfig.instance.newPageErrorIndicatorBuilder,
      firstPageProgressIndicatorBuilder: firstPageProgressIndicator != null
          ? (_) => firstPageProgressIndicator!
          : PagingViewConfig.instance.firstPageProgressIndicatorBuilder,
      newPageProgressIndicatorBuilder: newPageProgressIndicator != null
          ? (_) => newPageProgressIndicator!
          : PagingViewConfig.instance.newPageProgressIndicatorBuilder,
      noItemsFoundIndicatorBuilder: noItemsFoundIndicator != null
          ? (_) => noItemsFoundIndicator!
          : PagingViewConfig.instance.noItemsFoundIndicatorBuilder,
      noMoreItemsIndicatorBuilder: noMoreItemsIndicator != null
          ? (_) => noMoreItemsIndicator!
          : PagingViewConfig.instance.noMoreItemsIndicatorBuilder,
    );

    final pagedView = PagedSliverGrid(
      pagingController: pagingController.pagingController,
      builderDelegate: builderDelegate,
      gridDelegate: gridDelegate,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      showNewPageProgressIndicatorAsGridChild:
          showNewPageProgressIndicatorAsGridChild,
      showNewPageErrorIndicatorAsGridChild:
          showNewPageErrorIndicatorAsGridChild,
      showNoMoreItemsIndicatorAsGridChild: showNoMoreItemsIndicatorAsGridChild,
      shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
    );

    return pagedView;
  }
}
