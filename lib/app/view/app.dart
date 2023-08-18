import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/l10n/l10n.dart';
import 'package:botanic_gaze/l10n/l10n.dart';
import 'package:botanic_gaze/login/login_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimen.of(context);

    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.standard,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            BaseBlocLocalization.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const LoginPage(),
        );
      },
    );
  }
}
