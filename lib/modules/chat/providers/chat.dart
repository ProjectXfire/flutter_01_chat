import 'package:flutter/material.dart';
import 'package:flutter_02_chat/modules/chat/widgets/_widgets.dart';

class ChatProvider with ChangeNotifier {
  final controller = TextEditingController();
  String message = "";
  List<ChatMessage> messages = [];

  TextEditingController get inputChatController {
    return controller;
  }

  String get getMesssage {
    return message;
  }

  List<ChatMessage> get getMessagesWidgets {
    return messages;
  }

  set setInputChat(String textMessage) {
    message = textMessage;
    notifyListeners();
  }

  set setNewMessage(ChatMessage message) {
    messages.insert(0, message);
    notifyListeners();
  }
}
