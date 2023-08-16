import 'dart:async';
import 'dart:developer';

import 'package:base_bloc/base_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:flutter/widgets.dart';
import 'package:shared/shared.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await SharedConfig.getInstance().init();
  await BaseBlocConfig.getInstance().init();
  configureInjection();

  // Add cross-flavor configuration here

  runApp(await builder());
}
