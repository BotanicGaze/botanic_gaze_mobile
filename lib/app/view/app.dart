import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';

import 'package:base_bloc/l10n/l10n.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/l10n/l10n.dart';

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GoRouter router = getIt<AppNavigator>().router;

  @override
  Widget build(BuildContext context) {
    AppDimen.of(context);

    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (context, _) {
        return MaterialApp.router(
          theme: AppTheme.standard,
          routerConfig: router,
          // routeInformationProvider: router.routeInformationProvider,
          // routerDelegate: router.routerDelegate,
          // routeInformationParser: router.routeInformationParser,
          // backButtonDispatcher: router.backButtonDispatcher,
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            BaseBlocLocalization.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          // home: const LoginPage(),
        );
      },
    );
  }
}
