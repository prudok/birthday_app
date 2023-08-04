import 'dart:async';

import 'package:birthday_app/app.dart';
import 'package:birthday_app/config/config.dart';
import 'package:birthday_app/core/core.dart';
import 'package:birthday_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      configureDependencies();
      FlutterError.onError = (details) => getIt<ErrorHandler>().send(
            details.exception,
            details.stack,
          );
      runApp(const App());
    }, (error, stackTrace) {
      getIt<ErrorHandler>().send(error, stackTrace);
    });
