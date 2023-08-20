import 'package:paging_view/src/paging_constants.dart';

class LoadMoreOutput<T> {
  const LoadMoreOutput({
    required this.data,
    this.page = PagingConstants.initialPage,
    this.isRefreshSuccess = false,
    this.offset = 0,
    this.isLastPage = false,
    // this.otherData,
  });
  final List<T> data;
  // final Object? otherData;
  final int page;
  final bool isRefreshSuccess;
  final int offset;
  final bool isLastPage;

  int get nextPage => page + 1;
  int get previousPage => page - 1;
}
