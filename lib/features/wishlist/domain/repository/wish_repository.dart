import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';

abstract class WishRepository {
  Future<void> add(WishItem item);
  Future<WishList> getAll();
}
