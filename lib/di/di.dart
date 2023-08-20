import 'package:botanic_gaze/di/di.config.dart';
import 'package:shared/shared.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
