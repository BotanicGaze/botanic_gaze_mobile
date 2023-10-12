import 'package:botanic_gaze/models/index.dart';
import 'package:equatable/equatable.dart';

class UserLoginResponse extends Equatable {
  const UserLoginResponse({this.token, this.user});

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoResponse.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
  final String? token;
  final UserInfoResponse? user;

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
      };

  UserLoginResponse copyWith({
    String? token,
    UserInfoResponse? user,
  }) {
    return UserLoginResponse(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [token, user];
}
