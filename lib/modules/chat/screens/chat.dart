import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_02_chat/modules/chat/widgets/_widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[600],
              child: const Text(
                "US",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Username's Friends",
              style: TextStyle(color: Colors.black45),
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SizedBox(
        child: Column(
          children: const [
            Messages(),
            Divider(
              height: 1,
            ),
            InpuChat()
          ],
        ),
      ),
    );
  }
}
