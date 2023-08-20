import 'package:url_launcher/url_launcher.dart';

class IntentUtils {
  static Future<bool> openBrowserURL({
    required Uri url,
    bool inApp = false,
  }) async {
    return await canLaunchUrl(url)
        ? await launchUrl(
            url,
            mode: inApp ? LaunchMode.inAppWebView : LaunchMode.platformDefault,
          )
        : false;
  }
}
