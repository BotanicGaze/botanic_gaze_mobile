// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  @JsonKey(name: 'notification_id')
  String? get notificationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_type')
  String? get notificationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'notification_id') String? notificationId,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'notification_type') String? notificationType});
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? notificationType = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationDataCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$_NotificationDataCopyWith(
          _$_NotificationData value, $Res Function(_$_NotificationData) then) =
      __$$_NotificationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'notification_id') String? notificationId,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'notification_type') String? notificationType});
}

/// @nodoc
class __$$_NotificationDataCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$_NotificationData>
    implements _$$_NotificationDataCopyWith<$Res> {
  __$$_NotificationDataCopyWithImpl(
      _$_NotificationData _value, $Res Function(_$_NotificationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? message = freezed,
    Object? notificationType = freezed,
  }) {
    return _then(_$_NotificationData(
      notificationId: freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationData extends _NotificationData {
  const _$_NotificationData(
      {@JsonKey(name: 'notification_id') this.notificationId,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'notification_type') this.notificationType})
      : super._();

  factory _$_NotificationData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationDataFromJson(json);

  @override
  @JsonKey(name: 'notification_id')
  final String? notificationId;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'notification_type')
  final String? notificationType;

  @override
  String toString() {
    return 'NotificationData(notificationId: $notificationId, image: $image, title: $title, message: $message, notificationType: $notificationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationData &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, notificationId, image, title, message, notificationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      __$$_NotificationDataCopyWithImpl<_$_NotificationData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationDataToJson(
      this,
    );
  }
}

abstract class _NotificationData extends NotificationData {
  const factory _NotificationData(
          {@JsonKey(name: 'notification_id') final String? notificationId,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'notification_type') final String? notificationType}) =
      _$_NotificationData;
  const _NotificationData._() : super._();

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$_NotificationData.fromJson;

  @override
  @JsonKey(name: 'notification_id')
  String? get notificationId;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'notification_type')
  String? get notificationType;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}
