import 'package:auto_route/auto_route.dart';
import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_app/generated/l10n.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MenuItemView extends StatelessWidget {
  const MenuItemView({
    required this.title,
    required this.imagePath,
    super.key,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BirthdayAppBar(
        centerTitle: true,
        title: BirthdayText.custom(
          title,
          heading1Style.copyWith(fontFamily: 'Jost'),
        ),
        leading: IconButton(
          onPressed: () => context.popRoute(),
          icon: Image.asset(AssetPath.leftArrow),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                _OvalImage(imagePath: imagePath),
                Padding(
                  padding: EdgeInsets.only(
                    left: horizontalPaddingSmall,
                    bottom: verticalPaddingMedium,
                  ),
                  child: BirthdayText.custom(
                    title,
                    heading1Style.copyWith(fontFamily: 'YesevaOne'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPaddingSmall),
              child: Row(
                children: [
                  Column(
                    children: [
                      _CategoryItem(title: S.of(context).bread),
                      verticalSpaceSmall,
                      _CategoryItem(title: S.of(context).bread),
                    ],
                  ),
                  horizontalSpaceHigh,
                  Column(
                    children: [
                      _CategoryItem(title: S.of(context).bread),
                      verticalSpaceSmall,
                      _CategoryItem(title: S.of(context).bread),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OvalImage extends StatelessWidget {
  const _OvalImage({
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
        MediaQuery.of(context).size.width * 0.25,
        -50.toDouble(),
        0.toDouble(),
      ),
      child: ClipOval(
        child: SizedBox(
          height: 264.h,
          width: 357.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetPath.detailIcon),
        horizontalSpaceSmall,
        BirthdayText.headingTwo(title),
      ],
    );
  }
}
