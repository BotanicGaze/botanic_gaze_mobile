import 'package:shared/shared.dart';

abstract class AppPreferences with LogMixin {
  bool get isDarkMode;

  String get deviceToken;

  String get languageCode;

  bool get isFirstLogin;

  bool get isFirstLaunchApp;

  Future<String> get accessToken;

  Future<String> get refreshToken;

  bool get isLoggedIn;

  Future<bool> saveLanguageCode(String languageCode);

  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp);

  Future<void> saveAccessToken(String token);

  Future<void> saveRefreshToken(String token);

  Future<bool> saveIsDarkMode(bool isDarkMode);

  Future<bool> saveDeviceToken(String token);

  Future<void> clearCurrentUserData();
}
