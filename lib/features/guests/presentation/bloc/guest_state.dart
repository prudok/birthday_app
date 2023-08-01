part of 'guest_bloc.dart';

@freezed
class GuestState with _$GuestState {
  const factory GuestState.initial() = _Initial;
  const factory GuestState.processing() = _Processing;
  const factory GuestState.successfull({required GuestList guestList}) = _Successfull;
  const factory GuestState.error({required Exception error}) = _Error;
}
