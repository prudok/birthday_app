import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/config/config.dart';
import 'package:birthday_app/features/home/presentation/widgets/widgets.dart';
import 'package:birthday_app/generated/l10n.dart';
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
                child: BirthdayText.body(S.of(context).welcomeMessage),
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
                        title: S.of(context).guestList,
                        onTap: () => context.router.push(const GuestRoute()),
                      ),
                    ),
                    horizontalSpaceMedium,
                    Flexible(
                      child: BirthdayButton(
                        title: S.of(context).wishlist,
                        onTap: () => context.router.push(const WishlistRoute()),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceMedium,
              BirthdayText.custom(
                S.of(context).menu,
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              const MenuGrid(),
              verticalSpaceMedium,
              BirthdayText.custom(
                S.of(context).entertainment,
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              const BirthTiles(),
              verticalSpaceMedium,
              BirthdayText.custom(
                S.of(context).place,
                heading1Style.copyWith(fontFamily: 'YesevaOne'),
              ),
              verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: verticalPaddingSmall,
                ),
                child: const BirthdayMap(),
              ),
              BirthdayText.body(S.of(context).localAdress),
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
