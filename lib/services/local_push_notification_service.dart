import 'dart:convert';
import 'dart:io';
import 'dart:math';

// import 'package:domain/domain.dart';
import 'package:botanic_gaze/constants/index.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared/shared.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
      'notification action tapped with input: ${notificationResponse.input}',
    );
  }
}

@LazySingleton()
class LocalPushNotificationService with LogMixin {
  static const _channelId = 'jp.flutter.app';
  static const _channelName = 'NFT';
  static const _channelDescription = 'NFT';
  static const _androidDefaultIcon = 'ic_app_logo';
  static const _bitCount = 31;

  int get _randomNotificationId =>
      Random().nextInt(pow(2, _bitCount).toInt() - 1);

  static Future<void> init() async {
    await _requestPermissions();

    /// Change icon at android\app\src\main\res\drawable\app_icon.png
    const androidInit = AndroidInitializationSettings(_androidDefaultIcon);

    /// don't request permission here
    /// we use firebase_messaging package to request permission instead
    final iOSInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        // didReceiveLocalNotificationStream.add(
        //   ReceivedNotification(
        //     id: id,
        //     title: title,
        //     body: body,
        //     payload: payload,
        //   ),
        // );
      },
    );
    final init = InitializationSettings(android: androidInit, iOS: iOSInit);

    /// init local notification
    await Future.wait([
      flutterLocalNotificationsPlugin.initialize(
        init,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        // TODO(minh): handle later: onSelectNotification: _onSelectNotification,
      ),
    ]);

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: _channelDescription,
            importance: Importance.high,
          ),
        );
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      // final androidImplementation =
      //     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      //         AndroidFlutterLocalNotificationsPlugin>();

      // final grantedNotificationPermission =
      //     await androidImplementation?.requestNotificationsPermission();
      // setState(() {
      //   _notificationsEnabled = grantedNotificationPermission ?? false;
      // });
    }
  }

  Future<void> notify(AppNotification notification) async {
    File? imageFile;
    if (notification.image?.isNotEmpty ?? false) {
      imageFile = await FileUtils.getImageFileFromUrl(notification.image!);
      logD('Downloaded Image File: $imageFile');
    }

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: imageFile != null
          ? BigPictureStyleInformation(
              FilePathAndroidBitmap(imageFile.path),
              hideExpandedLargeIcon: true,
            )
          : null,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin
        .show(
          _randomNotificationId,
          notification.title,
          notification.message,
          platformChannelSpecifics,
        )
        .onError(
          (error, stackTrace) => logE('Can not show notification cause $error'),
        );
  }
}

class AppNotification extends Equatable {
  const AppNotification({
    required this.notificationType,
    this.notificationId,
    this.image,
    this.title,
    this.message,
  });

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      notificationId: map['notificationId'] as String?,
      notificationType: map['notificationType'] as NotificationType,
      image: map['image'] as String?,
      title: map['title'] as String?,
      message: map['message'] as String?,
    );
  }

  factory AppNotification.fromJson(String source) =>
      AppNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? notificationId;
  final NotificationType notificationType;
  final String? image;
  final String? title;
  final String? message;

  AppNotification copyWith({
    String? notificationId,
    NotificationType? notificationType,
    String? image,
    String? title,
    String? message,
  }) {
    return AppNotification(
      notificationId: notificationId ?? this.notificationId,
      notificationType: notificationType ?? this.notificationType,
      image: image ?? this.image,
      title: title ?? this.title,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (notificationId != null) {
      result.addAll({'notificationId': notificationId});
    }
    result.addAll({'notificationType': notificationType});
    if (image != null) {
      result.addAll({'image': image});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (message != null) {
      result.addAll({'message': message});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props {
    return [
      notificationId,
      notificationType,
      image,
      title,
      message,
    ];
  }
}
