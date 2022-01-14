import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(const App());
    },
    (object, stacktrace) {
      developer.log(
        'Unhandled Zone Exception',
        error: object,
        stackTrace: stacktrace,
      );
    },
  );
}
