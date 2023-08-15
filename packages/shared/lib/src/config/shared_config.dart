import 'package:shared/src/di/di.dart';
import 'package:shared/src/helper/app_info.dart';

import '../di/di.dart' as di;
import 'config.dart';

class SharedConfig extends Config {
  SharedConfig._();

  factory SharedConfig.getInstance() {
    return _instance;
  }

  static final SharedConfig _instance = SharedConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    await getIt<AppInfo>().init();
  }
}
