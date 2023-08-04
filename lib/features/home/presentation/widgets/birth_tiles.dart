import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/config/router.dart';
import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthTiles extends StatefulWidget {
  const BirthTiles({super.key});

  @override
  State<BirthTiles> createState() => _BirthTilesState();
}

class _BirthTilesState extends State<BirthTiles> with TickerProviderStateMixin {
  bool _isExpanded = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BirthdayListTile(
          imagePath: AssetPath.greenCircle,
          title: S.of(context).boardGames,
          subTitle: S.of(context).gameCategories,
          onTap: () => context.router.push(const AnimationRoute()),
        ),
        _BirthdayListTile(
          imagePath: AssetPath.blueCircle,
          title: S.of(context).pool,
          subTitle: S.of(context).twoHeatedPools,
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: -1,
          child: Column(
            children: [
              _BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: S.of(context).boardGames,
                subTitle: S.of(context).gameCategories,
              ),
              _BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: S.of(context).boardGames,
                subTitle: S.of(context).gameCategories,
              ),
              _BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: S.of(context).boardGames,
                subTitle: S.of(context).gameCategories,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            _isExpanded ? _controller.reverse() : _controller.forward();
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: BirthdayText.custom(
            _isExpanded ? S.of(context).collapse : S.of(context).expand,
            body1Style.copyWith(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}

class _BirthdayListTile extends StatelessWidget {
  const _BirthdayListTile({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, fit: BoxFit.cover),
      title: BirthdayText.custom(
        title,
        body1Style.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: BirthdayText.body(subTitle),
      trailing: IconButton(
        icon: Image.asset(AssetPath.rightArrow),
        onPressed: onTap,
      ),
    );
  }
}
