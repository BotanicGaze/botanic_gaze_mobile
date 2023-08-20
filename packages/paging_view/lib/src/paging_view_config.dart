import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PagingViewConfig extends Config {
  PagingViewConfig._();

  factory PagingViewConfig.getInstance() {
    return _instance;
  }

  static final PagingViewConfig _instance = PagingViewConfig._();

  static PagingViewConfig get instance => _instance;

  WidgetBuilder? _firstPageErrorIndicatorBuilder;
  WidgetBuilder? get firstPageErrorIndicatorBuilder =>
      _firstPageErrorIndicatorBuilder;

  WidgetBuilder? _newPageErrorIndicatorBuilder;
  WidgetBuilder? get newPageErrorIndicatorBuilder =>
      _newPageErrorIndicatorBuilder;

  WidgetBuilder? _firstPageProgressIndicatorBuilder;
  WidgetBuilder? get firstPageProgressIndicatorBuilder =>
      _firstPageProgressIndicatorBuilder;

  WidgetBuilder? _newPageProgressIndicatorBuilder;
  WidgetBuilder? get newPageProgressIndicatorBuilder =>
      _newPageProgressIndicatorBuilder;

  WidgetBuilder? _noItemsFoundIndicatorBuilder;
  WidgetBuilder? get noItemsFoundIndicatorBuilder =>
      _noItemsFoundIndicatorBuilder;

  WidgetBuilder? _noMoreItemsIndicatorBuilder;
  WidgetBuilder? get noMoreItemsIndicatorBuilder =>
      _noMoreItemsIndicatorBuilder;

  @override
  Future<void> config({ConfigArgument? configArgument}) async {
    if (configArgument is PagingViewConfigArgument) {
      _firstPageErrorIndicatorBuilder =
          configArgument.firstPageErrorIndicatorBuilder;
      _newPageErrorIndicatorBuilder =
          configArgument.newPageErrorIndicatorBuilder;
      _firstPageProgressIndicatorBuilder =
          configArgument.firstPageProgressIndicatorBuilder;
      _newPageProgressIndicatorBuilder =
          configArgument.newPageProgressIndicatorBuilder;
      _noItemsFoundIndicatorBuilder =
          configArgument.noItemsFoundIndicatorBuilder;
      _noMoreItemsIndicatorBuilder = configArgument.noMoreItemsIndicatorBuilder;
    }
  }
}

class PagingViewConfigArgument implements ConfigArgument {
  PagingViewConfigArgument({
    this.firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.noMoreItemsIndicatorBuilder,
  });

  /// The builder for the first page's error indicator.
  final WidgetBuilder? firstPageErrorIndicatorBuilder;

  /// The builder for a new page's error indicator.
  final WidgetBuilder? newPageErrorIndicatorBuilder;

  /// The builder for the first page's progress indicator.
  final WidgetBuilder? firstPageProgressIndicatorBuilder;

  /// The builder for a new page's progress indicator.
  final WidgetBuilder? newPageProgressIndicatorBuilder;

  /// The builder for a no items list indicator.
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  /// The builder for an indicator that all items have been fetched.
  final WidgetBuilder? noMoreItemsIndicatorBuilder;
}
