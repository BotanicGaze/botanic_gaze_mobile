import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:shared/shared.dart';

@LazySingleton()
class AppsflyerConfig {
  late AppsflyerSdk _appsflyerSdk;

  Future<void> init() async {
    final options = AppsFlyerOptions(
      afDevKey: 'aZL9QJyTaunHf7igmqFvUJ',
      showDebug: true,
      timeToWaitForATTUserAuthorization: 15,
    );

    _appsflyerSdk = AppsflyerSdk(options)
      ..onAppOpenAttribution((dynamic res) {
        Log.d('onAppOpenAttribution res: $res');
      })
      ..onInstallConversionData((dynamic res) {
        Log.d('onInstallConversionData res: $res');
      })
      ..onDeepLinking((DeepLinkResult dp) {
        switch (dp.status) {
          case Status.FOUND:
            Log.d(dp.deepLink);
            Log.d('deep link value: ${dp.deepLink?.deepLinkValue}');
          case Status.NOT_FOUND:
            Log.d('deep link not found');
          case Status.ERROR:
            Log.d('deep link error: ${dp.error}');
          case Status.PARSE_ERROR:
            Log.d('deep link status parsing error');
        }
        Log.d('onDeepLinking res: $dp');
      });
    await _appsflyerSdk.initSdk();
  }

  Uri? generateInviteLink() {
    Uri? uri;
    _appsflyerSdk.generateInviteLink(
      AppsFlyerInviteLinkParams(
        channel: 'User_invite',
        referrerName: 'name',
        brandDomain: 'fitcredit',
        customerID: '9876543210',
        campaign: 'In-App Referral',
      ),
      (Map<String, dynamic> res) {
        Log.d('generateInviteLink success: $res');
        uri = Uri.tryParse(res['payload']['userInviteURL'].toString());
      },
      (dynamic err) {
        Log.d('onAppOpenAttribution error: $err');
      },
    );
    return uri;
  }
}
