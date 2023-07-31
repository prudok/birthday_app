import 'dart:async';

import 'package:birthday_app/app.dart';
import 'package:birthday_app/config/injection.dart';
import 'package:birthday_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
void main() => runZonedGuarded<Future<void>>(() async {
      configureDependencies();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const App());
    }, (error, stackTrace) {
      if (kDebugMode) print('Error: $error, stackTrace: $stackTrace');
    });
