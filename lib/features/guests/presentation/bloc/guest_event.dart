part of 'guest_bloc.dart';

@freezed
class GuestEvent with _$GuestEvent {
  const GuestEvent._();
  const factory GuestEvent.add({required Guest guest}) = AddGuestEvent;
  const factory GuestEvent.remove({
    required String phoneNumber,
  }) = RemoveGuestEvent;
  const factory GuestEvent.reload() = ReloadGuestEvent;
}
