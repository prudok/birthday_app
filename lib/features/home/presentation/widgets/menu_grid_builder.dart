import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class MenuGridBuilder extends StatelessWidget {
  const MenuGridBuilder({
    required List<(String, String)> items,
    super.key,
  }) : _items = items;

  final List<(String, String)> _items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPaddingMedium,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: verticalPaddingSmall,
        crossAxisSpacing: horizontalPaddingMedium,
      ),
      itemBuilder: (context, ind) {
        return _MenuItem(
          imagePath: _items[ind].$1,
          title: _items[ind].$2,
          itemIndex: ind,
        );
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.imagePath,
    required this.title,
    required this.itemIndex,
  });

  final String imagePath;
  final String title;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(itemIndex.isEven ? 0 : 25),
              topRight: Radius.circular(itemIndex.isEven ? 25 : 0),
              bottomLeft: Radius.circular(itemIndex.isEven ? 25 : 0),
              bottomRight: Radius.circular(itemIndex.isEven ? 0 : 25),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        BirthdayText.body(title),
      ],
    );
  }
}
