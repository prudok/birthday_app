part of 'sorting_bloc.dart';

@freezed
class SortingEvent with _$SortingEvent {
  SortingEvent._();
  const factory SortingEvent.started() = _Started;
  const factory SortingEvent.sortByName({
    required GuestList guests,
  }) = _SortByName;
  const factory SortingEvent.sortByAge({
    required GuestList guests,
  }) = _SortByAge;
}
