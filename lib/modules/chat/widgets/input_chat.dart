import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_02_chat/modules/chat/widgets/chat_message.dart';
// External libraries
import 'package:provider/provider.dart';
// Providers
import 'package:flutter_02_chat/modules/chat/providers/_providers.dart';

class InpuChat extends StatefulWidget {
  const InpuChat({
    Key? key,
  }) : super(key: key);

  @override
  State<InpuChat> createState() => _InpuChatState();
}

class _InpuChatState extends State<InpuChat> with TickerProviderStateMixin {
  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Container(
      height: 50,
      color: Colors.white,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: chatProvider.controller,
                  autocorrect: false,
                  onChanged: (value) {
                    chatProvider.setInputChat = value;
                  },
                  decoration:
                      const InputDecoration.collapsed(hintText: "Send message"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                child: Platform.isIOS
                    ? const CupertinoButton(
                        onPressed: null,
                        child: Icon(Icons.send),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size(50, 50),
                            shadowColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor:
                                const Color.fromARGB(255, 65, 229, 35)),
                        onPressed: chatProvider.getMesssage.isEmpty
                            ? null
                            : () {
                                // TODO: Send message
                                final newMessage = ChatMessage(
                                    textMessage: chatProvider.getMesssage,
                                    uid: "123",
                                    animationController: AnimationController(
                                        vsync: this,
                                        duration:
                                            const Duration(milliseconds: 400)));
                                chatProvider.setNewMessage = newMessage;
                                newMessage.animationController.forward();
                                chatProvider.setInputChat = "";
                                chatProvider.controller.clear();
                              },
                        child: const Icon(Icons.send),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
