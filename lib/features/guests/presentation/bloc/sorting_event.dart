part of 'sorting_bloc.dart';

@freezed
class SortingEvent with _$SortingEvent {
  const SortingEvent._();
  const factory SortingEvent.sortByName({
    required GuestList guests,
  }) = SortByName;
  const factory SortingEvent.sortByAge({
    required GuestList guests,
  }) = SortByAge;
}
