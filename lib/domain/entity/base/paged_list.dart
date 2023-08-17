import 'package:botanic_gaze/domain/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_list.freezed.dart';

@freezed
class PagedList<T> with _$PagedList<T> {
  const factory PagedList({
    required List<T> data,
    @Default(null) Object? otherData,
    @Default(-99) int? next,
    @Default(-99) int? offset,
    @Default(-99) int? total,
  }) = _PagedList;
  const PagedList._();

  // TODO(minh): fix depend on project
  bool get isLastPage => data.isEmpty || next == null;

  LoadMoreOutput<T> toLoadMoreOutput() {
    return LoadMoreOutput(
      data: data,
      otherData: otherData,
      isLastPage: isLastPage,
    );
  }
}
