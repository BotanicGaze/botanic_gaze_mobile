import 'package:equatable/equatable.dart';

import 'package:botanic_gaze/models/responses/user_login_response/coin.dart';

class UserInfoResponse extends Equatable {
  const UserInfoResponse({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.avatar,
    this.inviteCode,
    this.coin,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return UserInfoResponse(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      inviteCode: json['inviteCode'] as String?,
      coin: json['coin'] == null
          ? null
          : Coin.fromJson(json['coin'] as Map<String, dynamic>),
      createdAt: json['CreatedAt'] == null
          ? null
          : DateTime.parse(json['CreatedAt'] as String),
      updatedAt: json['UpdatedAt'] == null
          ? null
          : DateTime.parse(json['UpdatedAt'] as String),
    );
  }
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? password;
  final String? avatar;
  final String? inviteCode;
  final Coin? coin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
        'avatar': avatar,
        'inviteCode': inviteCode,
        'coin': coin?.toJson(),
        'CreatedAt': createdAt?.toIso8601String(),
        'UpdatedAt': updatedAt?.toIso8601String(),
      };

  UserInfoResponse copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? password,
    String? avatar,
    String? inviteCode,
    Coin? coin,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserInfoResponse(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      inviteCode: inviteCode ?? this.inviteCode,
      coin: coin ?? this.coin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      username,
      email,
      password,
      avatar,
      inviteCode,
      coin,
      createdAt,
      updatedAt,
    ];
  }
}
