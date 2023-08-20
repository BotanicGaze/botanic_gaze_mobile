import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paging_view/src/controller/common_paging_controller.dart';
import 'package:paging_view/src/paging_constants.dart';
import 'package:paging_view/src/paging_view_config.dart';

class CommonPagedSliverList<T> extends StatelessWidget {
  const CommonPagedSliverList({
    required this.pagingController,
    required this.itemBuilder,
    this.animateTransitions = true,
    this.transitionDuration = PagingConstants.defaultListGridTransitionDuration,
    this.firstPageErrorIndicator,
    this.newPageErrorIndicator,
    this.firstPageProgressIndicator,
    this.newPageProgressIndicator,
    this.noItemsFoundIndicator,
    this.noMoreItemsIndicator,
    super.key,
    this.itemExtent,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.semanticIndexCallback,
    this.shrinkWrapFirstPageIndicators = false,
    this.separatorBuilder,
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

  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? itemExtent;
  final SemanticIndexCallback? semanticIndexCallback;
  final bool shrinkWrapFirstPageIndicators;
  final IndexedWidgetBuilder? separatorBuilder;

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

    final pagedView = separatorBuilder != null
        ? PagedSliverList.separated(
            pagingController: pagingController.pagingController,
            builderDelegate: builderDelegate,
            separatorBuilder: separatorBuilder!,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            itemExtent: itemExtent,
            shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
            semanticIndexCallback: semanticIndexCallback,
          )
        : PagedSliverList<int, T>(
            pagingController: pagingController.pagingController,
            builderDelegate: builderDelegate,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            itemExtent: itemExtent,
            shrinkWrapFirstPageIndicators: shrinkWrapFirstPageIndicators,
            semanticIndexCallback: semanticIndexCallback,
          );

    return pagedView;
  }
}
