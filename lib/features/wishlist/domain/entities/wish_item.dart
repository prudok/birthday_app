import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_item.freezed.dart';
part 'wish_item.g.dart';

@freezed
class WishItem with _$WishItem {
  const factory WishItem({
    required String name,
    required String link,
  }) = _WishItem;

  const WishItem._();

  factory WishItem.fromJson(Map<String, Object?> json) =>
      _$WishItemFromJson(json);
}
