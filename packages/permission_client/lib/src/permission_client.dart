import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart'
    show PermissionStatus, PermissionStatusGetters;

/// {@template permission_client}
/// A client that handles requesting permissions on a device.
/// {@endtemplate}
class PermissionClient {
  /// {@macro permission_client}
  const PermissionClient();

  /// Request access to the device's notifications,
  /// if access hasn't been previously granted.
  Future<PermissionStatus> requestNotifications() =>
      Permission.notification.request();

  /// Returns a permission status for the device's notifications.
  Future<PermissionStatus> notificationsStatus() =>
      Permission.notification.status;

  /// Request access to the device's camera,
  /// if access hasn't been previously granted.
  Future<PermissionStatus> requestCamera() => Permission.camera.request();

  /// Returns a permission status for the device's camera.
  Future<PermissionStatus> cameraStatus() => Permission.camera.status;

  /// Request access to the device's photos,
  /// if access hasn't been previously granted.
  Future<PermissionStatus> requestPhotos() => Permission.photos.request();

  /// Returns a permission status for the device's photos.
  Future<PermissionStatus> photosStatus() => Permission.photos.status;

  /// Request access to the device's storage,
  /// if access hasn't been previously granted.
  Future<PermissionStatus> requestStorage() => Permission.storage.request();

  /// Returns a permission status for the device's storage.
  Future<PermissionStatus> storageStatus() => Permission.storage.status;

  /// Opens the app settings page.
  ///
  /// Returns true if the settings could be opened, otherwise false.
  Future<bool> openPermissionSettings() => openAppSettings();
}
