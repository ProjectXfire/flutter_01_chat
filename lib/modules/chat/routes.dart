// Models
import 'package:flutter_02_chat/modules/shared/models/_models.dart';
// Screens
import 'package:flutter_02_chat/modules/chat/screens/_screens.dart';

class ChatRoutes {
  static final routes = <AppRoute>[
    AppRoute(nameRoute: "chat", screen: const ChatScreen()),
    AppRoute(nameRoute: "users", screen: const UsersScreen())
  ];
}
