import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthdayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BirthdayAppBar({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.centerTitle = false,
    this.backgroundColor = kWhiteColor,
  });

  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: title,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      titleTextStyle: const TextStyle(color: kBlackColor),
      iconTheme: const IconThemeData(
        color: kBlackColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
