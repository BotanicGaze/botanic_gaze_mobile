import 'package:async/async.dart';

abstract class Config {
  final AsyncMemoizer<void> _asyncMemoizer = AsyncMemoizer<void>();

  Future<void> config({ConfigArgument? configArgument});

  Future<void> init({ConfigArgument? configArgument}) =>
      _asyncMemoizer.runOnce(() => config(configArgument: configArgument));
}

abstract class ConfigArgument {}
