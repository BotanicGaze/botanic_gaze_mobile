// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationData _$$_NotificationDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationData(
      notificationId: json['notification_id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      notificationType: json['notification_type'] as String?,
    );

Map<String, dynamic> _$$_NotificationDataToJson(_$_NotificationData instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'image': instance.image,
      'title': instance.title,
      'message': instance.message,
      'notification_type': instance.notificationType,
    };
