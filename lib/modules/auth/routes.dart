// Models
import 'package:flutter_02_chat/modules/shared/models/_models.dart';
// Screens
import 'package:flutter_02_chat/modules/auth/screens/_screens.dart';

class AuthRoutes {
  static final routes = <AppRoute>[
    AppRoute(nameRoute: "login", screen: const LoginScreen()),
    AppRoute(nameRoute: "register", screen: const RegisterScreen())
  ];
}
