import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list.freezed.dart';
part 'wish_list.g.dart';

@freezed
class WishList with _$WishList {
  const factory WishList({
    required List<WishItem> items,
  }) = _WishList;

  const WishList._();

  factory WishList.fromJson(Map<String, Object?> json) =>
      _$WishListFromJson(json);
}
