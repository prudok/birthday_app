import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';

abstract class WishAPI {
  Future<void> load(WishItem wishItem);
  Future<WishList> getAll();
}
