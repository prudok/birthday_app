import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthdayButton extends StatelessWidget {
  const BirthdayButton({
    required this.title,
    super.key,
    this.onTap,
    this.leading,
    this.color = kOrangeColor,
  });

  final String title;
  final void Function()? onTap;
  final Color? color;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BirthdayText.custom(
                  title,
                  body1Style.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
