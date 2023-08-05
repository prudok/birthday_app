part of 'wish_bloc.dart';

@freezed
class WishState with _$WishState {
  const factory WishState.initial() = _Initial;
  const factory WishState.processing() = _Processing;
  const factory WishState.successful({
    required WishList wishList,
  }) = _Successful;
  const factory WishState.error({required Object error}) = _Error;
}
