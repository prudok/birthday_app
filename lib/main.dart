import 'package:birthday_app/app.dart';
import 'package:birthday_app/config/injection.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
