import 'dart:async';

import 'package:birthday_app/app.dart';
import 'package:birthday_app/config/injection.dart';
import 'package:birthday_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      configureDependencies();
      runApp(const App());
    }, (error, stackTrace) {
      if (kDebugMode) print('Error: \n$error, \nstackTrace: \n$stackTrace');
    });
