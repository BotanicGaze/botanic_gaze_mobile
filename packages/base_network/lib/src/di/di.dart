import 'package:shared/shared.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() => getIt.init();
