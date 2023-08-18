import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:paging_view/src/controller/common_paging_controller.dart';
import 'package:paging_view/src/error_view/common_first_page_error_indicator.dart';
import 'package:paging_view/src/error_view/common_new_page_error_indicator.dart';
import 'package:paging_view/src/loading_view/common_first_page_progress_indicator.dart';
import 'package:paging_view/src/loading_view/common_new_page_progress_indicator.dart';
import 'package:paging_view/src/no_items_found_view/common_no_items_found_indicator.dart';
import 'package:paging_view/src/no_more_items_view/common_no_more_items_indicator.dart';

import 'package:paging_view/src/paging_constants.dart';

class CommonPagedGridView<T> extends StatelessWidget {
  const CommonPagedGridView({
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
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.cacheExtent,
    this.restorationId,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.clipBehavior = Clip.hardEdge,
    this.showNewPageProgressIndicatorAsGridChild = false,
    this.showNewPageErrorIndicatorAsGridChild = false,
    this.showNoMoreItemsIndicatorAsGridChild = false,
    this.onRefresh,
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

  final ScrollController? scrollController;
  final Axis scrollDirection;
  final bool reverse;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;

  final SliverGridDelegate gridDelegate;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? itemExtent;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final bool showNewPageProgressIndicatorAsGridChild;
  final bool showNewPageErrorIndicatorAsGridChild;
  final bool showNoMoreItemsIndicatorAsGridChild;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    final builderDelegate = PagedChildBuilderDelegate<T>(
      itemBuilder: itemBuilder,
      animateTransitions: animateTransitions,
      transitionDuration: transitionDuration,
      firstPageErrorIndicatorBuilder: (_) =>
          firstPageErrorIndicator ?? const CommonFirstPageErrorIndicator(),
      newPageErrorIndicatorBuilder: (_) =>
          newPageErrorIndicator ?? const CommonNewPageErrorIndicator(),
      firstPageProgressIndicatorBuilder: (_) =>
          firstPageProgressIndicator ??
          const CommonFirstPageProgressIndicator(),
      newPageProgressIndicatorBuilder: (_) =>
          newPageProgressIndicator ?? const CommonNewPageProgressIndicator(),
      noItemsFoundIndicatorBuilder: (_) =>
          noItemsFoundIndicator ?? const CommonNoItemsFoundIndicator(),
      noMoreItemsIndicatorBuilder: (_) =>
          noMoreItemsIndicator ?? const CommonNoMoreItemsIndicator(),
    );

    final pagedView = PagedGridView<int, T>(
      pagingController: pagingController.pagingController,
      builderDelegate: builderDelegate,
      gridDelegate: gridDelegate,
      scrollDirection: scrollDirection,
      reverse: reverse,
      scrollController: scrollController,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      cacheExtent: cacheExtent,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      showNewPageErrorIndicatorAsGridChild:
          showNewPageErrorIndicatorAsGridChild,
      showNewPageProgressIndicatorAsGridChild:
          showNewPageProgressIndicatorAsGridChild,
      showNoMoreItemsIndicatorAsGridChild: showNoMoreItemsIndicatorAsGridChild,
    );

    return pagedView;
  }
}
