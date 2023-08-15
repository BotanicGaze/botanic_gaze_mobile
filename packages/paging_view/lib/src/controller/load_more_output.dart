// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:paging_view/domain.dart';
// import 'package:shared/shared.dart';

// part 'load_more_output.freezed.dart';

// @freezed
// class LoadMoreOutput<T> extends BaseOutput with _$LoadMoreOutput<T> {
//   const factory LoadMoreOutput({
//     required List<T> data,
//     @Default(null) Object? otherData,
//     @Default(PagingConstants.initialPage) int page,
//     @Default(false) bool isRefreshSuccess,
//     @Default(0) int offset,
//     @Default(false) bool isLastPage,
//   }) = _LoadMoreOutput;
//   const LoadMoreOutput._();

//   int get nextPage => page + 1;
//   int get previousPage => page - 1;
// }

class LoadMoreOutput<T> {
  LoadMoreOutput({
    required this.data,
    required this.page,
    required this.isRefreshSuccess,
    required this.offset,
    required this.isLastPage,
    this.otherData,
  });
  final List<T> data;
  final Object? otherData;
  final int page;
  final bool isRefreshSuccess;
  final int offset;
  final bool isLastPage;
}
