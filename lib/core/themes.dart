import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: kBackgroundColor,
    primary: kPrimaryGreenColor,
    onPrimary: kWhiteColor,
    secondary: kLightGreenColor,
    onSecondary: kLightGreenColor,
    secondaryContainer: kOrangeColor,
    error: kErrorColor,
    onError: kErrorColor,
    onBackground: kBackgroundColor,
    surface: kWhiteColor,
    onSurface: kBlackColor,
  ),
);
