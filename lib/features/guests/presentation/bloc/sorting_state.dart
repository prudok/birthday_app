part of 'sorting_bloc.dart';

@freezed
class SortingState with _$SortingState {
  const factory SortingState.initial() = _Initial;
  const factory SortingState.sortedByName({required GuestList guests}) =
      _SortedByName;
  const factory SortingState.sorting() = _Sorting;
  const factory SortingState.sortedByAge({required GuestList guests}) =
      _SortedByAge;
}
