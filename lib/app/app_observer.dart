import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('$event Fired');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error on bloc ${bloc.runtimeType}',
        error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} changed: $change');
  }
}
