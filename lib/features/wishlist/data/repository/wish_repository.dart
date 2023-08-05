import 'package:birthday_app/features/wishlist/data/datasource/wish_api_impl.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_item.dart';
import 'package:birthday_app/features/wishlist/domain/entities/wish_list.dart';
import 'package:birthday_app/features/wishlist/domain/repository/wish_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class WishRepositoryImpl extends WishRepository {
  WishRepositoryImpl(this.wishAPIImpl);

  final WishAPIImpl wishAPIImpl;

  @override
  Future<void> add(WishItem item) async {
    await wishAPIImpl.load(item);
  }

  @override
  Future<WishList> getAll() async {
    return wishAPIImpl.getAll();
  }
}
