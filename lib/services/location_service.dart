import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationService {
  Future<Position?> getCurrentPosition() async {
    final isGranted = await requestPermission();
    if (isGranted) {
      return await Geolocator.getCurrentPosition();
    }
    return null;
  }

  Future<bool> requestPermission() async {
    try {
      bool serviceEnabled;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      LocationPermission permission;
      if (!serviceEnabled) {
        log('Location services are disabled.', name: runtimeType.toString());
        return false;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          log('Location permissions are denied', name: runtimeType.toString());
          return false;
        }
      } else if (permission == LocationPermission.deniedForever) {
        log(
          'Location permissions are permanently denied, we cannot request permissions.',
          name: runtimeType.toString(),
        );
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
