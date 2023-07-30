import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/config/router.dart';
import 'package:birthday_app/features/home/presentation/widgets/birth_tiles.dart';
import 'package:birthday_app/features/home/presentation/widgets/birthday_map.dart';
import 'package:birthday_app/features/home/presentation/widgets/carousel_widget.dart';
import 'package:birthday_app/features/home/presentation/widgets/menu_grid.dart';
import 'package:birthday_app/features/home/presentation/widgets/url_text.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselWidget(),
              verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPaddingSmall,
                ),
                child: BirthdayText.body(
                  'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPaddingSmall,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: BirthdayButton(
                        title: 'Список Гостей',
                        onTap: () => context.router.push(const GuestRoute()),
                      ),
                    ),
                    horizontalSpaceMedium,
                    Flexible(
                      child: BirthdayButton(
                        title: 'Вишлист',
                        onTap: () => context.router.push(const WishlistRoute()),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              BirthdayText.custom(
                'Меню',
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              const MenuGrid(),
              verticalSpaceMedium,
              BirthdayText.custom(
                'Развлечения',
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              const BirthTiles(),
              verticalSpaceMedium,
              BirthdayText.custom(
                'Место',
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: verticalPaddingSmall,
                ),
                child: const BirthdayMap(),
              ),
              BirthdayText.body('Центральная ул., 84, хутор Седых'),
              verticalSpaceSmall,
              UrlText(),
              verticalSpaceHigh,
            ],
          ),
        ),
      ),
    );
  }
}
