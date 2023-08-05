part of 'wish_bloc.dart';

@freezed
class WishEvent with _$WishEvent {
  const WishEvent._();
  const factory WishEvent.add({required WishItem wishItem}) = AddWishEvent;
  const factory WishEvent.reload() = ReloadWishEvent;
}
