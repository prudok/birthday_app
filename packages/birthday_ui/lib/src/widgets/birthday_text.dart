import 'package:birthday_ui/src/shared/colors.dart';
import 'package:birthday_ui/src/shared/styles.dart';
import 'package:flutter/material.dart';

class BirthdayText extends StatelessWidget {
  BirthdayText.headingOne(this.text, {super.key}) : style = heading1Style;

  BirthdayText.headingTwo(this.text, {super.key}) : style = heading2Style;

  BirthdayText.body(
    this.text, {
    super.key,
    Color color = kMediumGreyColor,
  }) : style = body1Style.copyWith(color: color);

  const BirthdayText.custom(this.text, this.style, {super.key});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
