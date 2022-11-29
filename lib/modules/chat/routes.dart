// Models
import 'package:flutter_02_chat/modules/chat/providers/chat.dart';
import 'package:flutter_02_chat/modules/shared/models/_models.dart';
// Screens
import 'package:flutter_02_chat/modules/chat/screens/_screens.dart';
import 'package:provider/provider.dart';

class ChatRoutes {
  static final routes = <AppRoute>[
    AppRoute(
        nameRoute: "chat",
        screen: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ChatProvider(),
            )
          ],
          child: const ChatScreen(),
        )),
    AppRoute(nameRoute: "users", screen: UsersScreen())
  ];
}
