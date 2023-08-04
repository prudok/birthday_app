import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// ErrorHandler Singleton class is used to store all exceptions and send them
/// to crashlytics
@Singleton()
class ErrorHandler {
  void send(Object error, StackTrace? stackTrace) {
    // In real case the error'll be transferred to crashlytics
    if (kDebugMode) {
      print(' ----- Something went wrong. ----- ');
      print('Error: $error');
      print('Stacktrace: \n$stackTrace');
    }
  }
}
