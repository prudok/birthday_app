import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/features/animations/presentation/views/animation_view.dart';
import 'package:birthday_app/features/guests/presentation/views/guest_view.dart';
import 'package:birthday_app/features/home/presentation/views/home_view.dart';
import 'package:birthday_app/features/home/presentation/views/menu_item_view.dart';
import 'package:birthday_app/features/wishlist/presentation/views/wishlist_view.dart';
import 'package:injectable/injectable.dart';

part 'router.gr.dart';

@Singleton()
@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: GuestRoute.page),
        AutoRoute(page: WishlistRoute.page),
        AutoRoute(page: AnimationRoute.page),
        AutoRoute(page: MenuItemRoute.page),
      ];
}
