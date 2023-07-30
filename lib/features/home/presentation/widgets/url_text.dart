import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends StatelessWidget {
  UrlText({super.key});

  final _url = Uri.parse('https://www.youtube.com/watch?v=o-YBDTqX_ZU');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await launchUrl(_url);
        } catch (err, stackTrace) {
          Error.throwWithStackTrace(err, stackTrace);
        }
      },
      child: BirthdayText.custom(
        'Перейти на сайт места',
        bodyStyle.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }
}
