import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? "http://192.168.1.15:3010/api"
      : "http://localhost:3010/api";

  static String socketUrl =
      Platform.isAndroid ? "http://192.168.1.15:3020" : "http://localhost:3020";
}
