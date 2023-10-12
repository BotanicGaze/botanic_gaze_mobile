import 'package:app_ui/app_ui.dart';
import 'package:base_bloc/base_bloc.dart';
import 'package:base_bloc/l10n/l10n.dart';
import 'package:botanic_gaze/app/index.dart';
import 'package:botanic_gaze/di/di.dart';
import 'package:botanic_gaze/features/profile/index.dart';
import 'package:botanic_gaze/l10n/l10n.dart';
import 'package:botanic_gaze/services/dynamic_link_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart' hide DeviceConstants;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BasePageState<App, AppBloc> {
  final GoRouter router = getIt<AppNavigator>().router;

  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.add(AppInitialized());
    FirebaseDynamicLinksService.initDynamicLinks();
    ViewUtils.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    AppDimen.of(context);

    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(
          DeviceConstants.designDeviceWidth,
          DeviceConstants.designDeviceHeight,
        ),
        builder: (context, _) {
          return MaterialApp.router(
            theme: AppTheme.standard,
            routerConfig: router,
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
              BaseBlocLocalization.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            // home: const LoginPage(),
          );
        },
      ),
    );
  }
}
