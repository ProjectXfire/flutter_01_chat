import 'dart:convert';
// Models
import 'package:flutter_02_chat/modules/chat/models/_models.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.accessToken,
    required this.user,
  });

  String accessToken;
  User user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        accessToken: json["access_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "user": user.toJson(),
      };
}
