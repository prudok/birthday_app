part of 'guest_bloc.dart';

@freezed
class GuestState with _$GuestState {
  const factory GuestState.initial() = _Initial;
  const factory GuestState.processing() = _Processing;
  const factory GuestState.successful({
    required GuestList guestList,
  }) = _Successful;
  const factory GuestState.error({required Object error}) = _Error;
}
