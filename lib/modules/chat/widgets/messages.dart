import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:flutter_02_chat/modules/chat/providers/_providers.dart';

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Flexible(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: chatProvider.getMessagesWidgets.length,
      itemBuilder: (context, index) => chatProvider.getMessagesWidgets[index],
      reverse: true,
    ));
  }
}
