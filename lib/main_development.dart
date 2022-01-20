import 'dart:async';
import 'dart:developer' as developer;
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/app_observer.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await BlocOverrides.runZoned(() async => runApp(const App()),
          blocObserver: AppBlocObserver());
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
