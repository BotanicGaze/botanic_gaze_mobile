// ignore_for_file: invalid_use_of_visible_for_testing_member,, invalid_use_of_protected_member
// invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paging_view/src/controller/load_more_output.dart';
import 'package:paging_view/src/paging_constants.dart';
import 'package:shared/shared.dart';

class CommonPagingController<T> implements Disposable {
  CommonPagingController({
    this.invisibleItemsThreshold =
        PagingConstants.defaultInvisibleItemsThreshold,
    this.firstPageKey = PagingConstants.initialPage,
  }) : pagingController = PagingController<int, T>(
          firstPageKey: firstPageKey,
          invisibleItemsThreshold: invisibleItemsThreshold,
        );

  final PagingController<int, T> pagingController;

  final int? invisibleItemsThreshold;
  final int firstPageKey;

  // call when error
  set error(AppException? appException) {
    pagingController.error = appException;
  }

  // call when initState to listen to trigger load more
  void listen({
    required ValueChanged<int> onLoadMore,
    VoidCallback? onRefresh,
  }) {
    pagingController
      ..addPageRequestListener((pageKey) {
        if (pageKey > PagingConstants.initialPage) {
          onLoadMore(pageKey);
        }
      })
      ..addStatusListener((status) {
        if (status == PagingStatus.loadingFirstPage) {
          onRefresh?.call();
        }
      });
  }

  // call append data when load first page / more page success
  void appendLoadMoreOutput(LoadMoreOutput<T> loadMoreOutput) {
    if (loadMoreOutput.isRefreshSuccess) {
      pagingController.refresh();
    }

    if (loadMoreOutput.isLastPage) {
      pagingController.appendLastPage(loadMoreOutput.data);
    } else {
      pagingController.appendPage(
        loadMoreOutput.data,
        (pagingController.nextPageKey ?? (PagingConstants.initialPage - 1)) + 1,
      );
    }
  }

  void insertItemAt(int index, T item) {
    pagingController.itemList?.insert(index, item);

    pagingController.notifyListeners();
  }

  void insertAllItemsAt(int index, Iterable<T> items) {
    pagingController.itemList?.insertAll(index, items);

    pagingController.notifyListeners();
  }

  void updateItemAt(int index, T newItem) {
    pagingController.itemList?[index] = newItem;

    pagingController.notifyListeners();
  }

  void removeItemAt(int index) {
    pagingController.itemList?.removeAt(index);

    pagingController.notifyListeners();
  }

  void removeRange(int start, int end) {
    pagingController.itemList?.removeRange(start, end);

    pagingController.notifyListeners();
  }

  void clear(int start, int end) {
    pagingController.itemList?.clear();

    pagingController.notifyListeners();
  }

  void refresh() {
    pagingController.refresh();
  }

  @override
  void dispose() {
    pagingController.dispose();
  }
}

// abstract class AppException implements Exception {
//   const AppException(this.appExceptionType);

//   final AppExceptionType appExceptionType;
// }

enum AppExceptionType {
  remote,
  parse,
  remoteConfig,
  uncaught,
  validation,
}
