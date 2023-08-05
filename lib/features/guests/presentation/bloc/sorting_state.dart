part of 'sorting_bloc.dart';

@freezed
class SortingState with _$SortingState {
  const factory SortingState.initial() = _Initial;
  const factory SortingState.sortingByName() = _SortingByName;
  const factory SortingState.sortingByAge() = _SortinByAge;
}
