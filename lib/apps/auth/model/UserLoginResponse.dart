import 'package:first_progam_flutter/apps/auth/model/UserInterface.dart';
class UserLoginResponse {
  final UserInterface user;
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  UserLoginResponse({
    required this.user,
    required this.accessToken,

    required this.refreshToken,
    required this.tokenType,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      user: UserInterface.fromJson(json['user']),
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      tokenType: json['tokenType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
    };
  }
}
