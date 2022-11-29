import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// Models
import 'package:flutter_02_chat/modules/shared/models/_models.dart';
import 'package:flutter_02_chat/modules/auth/models/_models.dart';
import 'package:flutter_02_chat/modules/chat/models/_models.dart';
// Variables
import 'package:flutter_02_chat/modules/shared/variables/_variables.dart';

class AuthProvider with ChangeNotifier {
  bool _authenticating = false;
  final _storage = const FlutterSecureStorage();
  late User user;

  //--> Handle session

  bool get getAuthenticating {
    return _authenticating;
  }

  set setAuthenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  String get getUsername {
    return user.username;
  }

  Future login(String email, String password) async {
    setAuthenticating = true;
    try {
      final data = {
        "email": email,
        "password": password,
      };
      final url = Uri.parse("${Environment.apiUrl}/auth/login");
      final resp = await http.post(url, body: data);
      if (resp.statusCode == 200) {
        final authResponse = authResponseFromJson(resp.body);
        await _saveToken(authResponse.accessToken);
        user = authResponse.user;
        setAuthenticating = false;
        return true;
      }
      final errorResponse = errorMessageFromJson(resp.body);
      setAuthenticating = false;
      if (errorResponse.message.runtimeType == String) {
        return errorResponse.message;
      }
      String message = "";
      for (var item in errorResponse.message) {
        message = "$item\n";
      }
      return message;
    } catch (e) {
      setAuthenticating = false;
    }
  }

  Future register(String username, String email, String password) async {
    try {
      final data = {
        "username": username,
        "email": email,
        "password": password,
      };
      final url = Uri.parse("${Environment.apiUrl}/auth/register");
      final resp = await http.post(url, body: data);
      if (resp.statusCode == 201) {
        final authResponse = authResponseFromJson(resp.body);
        await _saveToken(authResponse.accessToken);
        user = authResponse.user;
        setAuthenticating = false;
        return true;
      }
      final errorResponse = errorMessageFromJson(resp.body);
      setAuthenticating = false;
      if (errorResponse.message.runtimeType == String) {
        return errorResponse.message;
      }
      String message = "";
      for (var item in errorResponse.message) {
        message = "$item\n";
      }
      return message;
    } catch (e) {
      setAuthenticating = false;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final token = await _storage.read(key: "token");
      final url = Uri.parse("${Environment.apiUrl}/auth/renew");
      final resp =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (resp.statusCode == 200) {
        final authResponse = authResponseFromJson(resp.body);
        await _saveToken(authResponse.accessToken);
        user = authResponse.user;
        return true;
      }

      await logout();
      return false;
    } catch (e) {
      await logout();
      setAuthenticating = false;
      return false;
    }
  }

  //--> Handle Token

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    return token;
  }

  Future _saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  logout() async {
    await _storage.delete(key: "token");
  }
}
