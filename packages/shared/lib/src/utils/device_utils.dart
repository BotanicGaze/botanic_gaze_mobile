import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared/src/constants/ui/device_constants.dart';
import 'package:shared/src/model/shared_enum.dart';

class DeviceUtils {
  const DeviceUtils._();
  static DeviceType deviceType = _getDeviceType();

  static Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.identifierForVendor ?? "Unknown device";
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      return androidInfo.id;
    }
  }

  static Future<String> getDeviceModelName() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      return iosInfo.name;
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      return '${androidInfo.brand} ${androidInfo.device}';
    }
  }

  static DeviceType _getDeviceType() {
    return MediaQueryData.fromView(
                    WidgetsBinding.instance.platformDispatcher.views.first)
                .size
                .shortestSide <
            DeviceConstants.maxMobileWidthForDeviceType
        ? DeviceType.mobile
        : DeviceType.tablet;
  }
}
