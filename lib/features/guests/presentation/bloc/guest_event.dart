part of 'guest_bloc.dart';

@freezed
class GuestEvent with _$GuestEvent {
  const GuestEvent._();
  const factory GuestEvent.add({required Guest guest}) = AddGuestEvent;
  const factory GuestEvent.remove({required int id}) = RemoveGuestEvent;
}
