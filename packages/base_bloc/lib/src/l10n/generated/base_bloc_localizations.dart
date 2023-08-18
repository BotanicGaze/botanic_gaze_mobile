import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'base_bloc_localizations_en.dart';
import 'base_bloc_localizations_ja.dart';

/// Callers can lookup localized strings with an instance of BaseBlocLocalizations
/// returned by `BaseBlocLocalizations.of(context)`.
///
/// Applications need to include `BaseBlocLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/base_bloc_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BaseBlocLocalizations.localizationsDelegates,
///   supportedLocales: BaseBlocLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the BaseBlocLocalizations.supportedLocales
/// property.
abstract class BaseBlocLocalizations {
  BaseBlocLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BaseBlocLocalizations? of(BuildContext context) {
    return Localizations.of<BaseBlocLocalizations>(context, BaseBlocLocalizations);
  }

  static const LocalizationsDelegate<BaseBlocLocalizations> delegate = _BaseBlocLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @unknownException.
  ///
  /// In en, this message translates to:
  /// **'unknownException'**
  String get unknownException;

  /// No description provided for @parseException.
  ///
  /// In en, this message translates to:
  /// **'parseException'**
  String get parseException;

  /// No description provided for @cancellationException.
  ///
  /// In en, this message translates to:
  /// **'cancellationException'**
  String get cancellationException;

  /// No description provided for @noInternetException.
  ///
  /// In en, this message translates to:
  /// **'noInternetException'**
  String get noInternetException;

  /// No description provided for @timeoutException.
  ///
  /// In en, this message translates to:
  /// **'timeoutException'**
  String get timeoutException;

  /// No description provided for @badCertificateException.
  ///
  /// In en, this message translates to:
  /// **'badCertificateException'**
  String get badCertificateException;

  /// No description provided for @canNotConnectToHost.
  ///
  /// In en, this message translates to:
  /// **'Can not connect to this host'**
  String get canNotConnectToHost;

  /// No description provided for @tokenExpired.
  ///
  /// In en, this message translates to:
  /// **'tokenExpired'**
  String get tokenExpired;

  /// No description provided for @emptyEmail.
  ///
  /// In en, this message translates to:
  /// **'emptyEmail'**
  String get emptyEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'invalidEmail'**
  String get invalidEmail;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'invalidPassword'**
  String get invalidPassword;

  /// No description provided for @invalidUserName.
  ///
  /// In en, this message translates to:
  /// **'invalidUserName'**
  String get invalidUserName;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'invalidPhoneNumber'**
  String get invalidPhoneNumber;

  /// No description provided for @invalidDateTime.
  ///
  /// In en, this message translates to:
  /// **'invalidDateTime'**
  String get invalidDateTime;

  /// No description provided for @passwordsAreNotMatch.
  ///
  /// In en, this message translates to:
  /// **'passwordsAreNotMatch'**
  String get passwordsAreNotMatch;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @myPage.
  ///
  /// In en, this message translates to:
  /// **'My Page'**
  String get myPage;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;
}

class _BaseBlocLocalizationsDelegate extends LocalizationsDelegate<BaseBlocLocalizations> {
  const _BaseBlocLocalizationsDelegate();

  @override
  Future<BaseBlocLocalizations> load(Locale locale) {
    return SynchronousFuture<BaseBlocLocalizations>(lookupBaseBlocLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_BaseBlocLocalizationsDelegate old) => false;
}

BaseBlocLocalizations lookupBaseBlocLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return BaseBlocLocalizationsEn();
    case 'ja': return BaseBlocLocalizationsJa();
  }

  throw FlutterError(
    'BaseBlocLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
