import 'dart:convert';

ErrorMessage errorMessageFromJson(String str) =>
    ErrorMessage.fromJson(json.decode(str));

String errorMessageToJson(ErrorMessage data) => json.encode(data.toJson());

class ErrorMessage {
  ErrorMessage({
    required this.statusCode,
    required this.message,
    this.error,
  });

  int statusCode;
  dynamic message;
  String? error;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        statusCode: json["statusCode"],
        message: json["message"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "error": error,
      };
}
