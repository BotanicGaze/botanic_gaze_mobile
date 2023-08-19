part of 'search_bloc.dart';

sealed class SearchEvent extends BaseBlocEvent with EquatableMixin {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
