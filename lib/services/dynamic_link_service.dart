import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:shared/shared.dart';

class FirebaseDynamicLinksService {
  static final FirebaseDynamicLinks instance = FirebaseDynamicLinks.instance;

  static Future<void> initDynamicLinks() async {
    instance.onLink.listen((dynamicLinkData) {
      Log.d(dynamicLinkData);
      final deepLink = dynamicLinkData.link;
      _saveInviteId(deepLink);
    });
  }

  static Future<PendingDynamicLinkData?> onInitialLink() async {
    Log.d('FirebaseDynamicLinksService onInitialLink');
    return instance.getInitialLink();
  }

  /// Creates a short dynamic link for the application.
  static Future<Uri> createShortDynamicLink({
    required Uri uri,
    String? title,
    String? description,
    String? imageUrl,
  }) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();

      final parameters = DynamicLinkParameters(
        socialMetaTagParameters: SocialMetaTagParameters(
          title: title,
          description: description,
          imageUrl: imageUrl != null ? Uri.tryParse(imageUrl) : null,
        ),
        uriPrefix: 'https://botanicgaze.page.link',
        link: uri,
        androidParameters: AndroidParameters(
          packageName: packageInfo.packageName,
          minimumVersion: 0,
        ),
        iosParameters: IOSParameters(
          bundleId: packageInfo.packageName,
          minimumVersion: '0',
        ),
      );
      final shortLink = await instance.buildShortLink(parameters);
      return shortLink.shortUrl;
    } catch (e) {
      Log.d('Create Short Dynamic Link error: $e');
      return uri;
    }
  }

  /// Creates a referral dynamic link for the application.
  static Future<Uri?> createReferralLink({
    required String referralCode,
  }) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      print(packageInfo.packageName);
      final parameters = DynamicLinkParameters(
        uriPrefix: 'https://botanicgaze.page.link',
        link: Uri(
          scheme: 'https',
          host: 'botanic-gaze.net',
          path: 'referral',
          queryParameters: {
            'referralCode': referralCode,
          },
        ),
        androidParameters: AndroidParameters(
          packageName: packageInfo.packageName,
          minimumVersion: 0,
        ),
        iosParameters: IOSParameters(
          bundleId: packageInfo.packageName,
        ),
      );
      final shortLink = await instance.buildShortLink(parameters);
      return shortLink.shortUrl;
    } catch (e) {
      Log.d('Create Short Dynamic Link error: $e');
      return null;
    }
  }

  static void _saveInviteId(Uri? deepLink) {
    if (deepLink == null) return;
    // final data = deepLink.toString();
    // if (data.contains('referralCode')) {
    //   final invite = data.substring(
    //     data.indexOf('referralCode=') + 'referralCode='.length + 1,
    //     data.length,
    //   );
    //   // final UserManagement userManagement = getIt<UserManagement>();
    //   // userManagement.saveInviteId(invite);
    // }
  }
}
