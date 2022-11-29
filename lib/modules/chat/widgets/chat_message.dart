import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String textMessage;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    super.key,
    required this.textMessage,
    required this.uid,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        child: Container(
          child: uid == "123"
              ? _Message(
                  position: Alignment.centerRight,
                  message: textMessage,
                  color: const Color.fromARGB(255, 48, 102, 218),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                )
              : _Message(
                  position: Alignment.centerLeft,
                  message: textMessage,
                  color: const Color.fromARGB(255, 219, 219, 219),
                  textColor: const Color.fromARGB(255, 0, 0, 0),
                ),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    Key? key,
    required this.position,
    required this.message,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  final AlignmentGeometry position;
  final String message;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position,
      child: Container(
        margin: EdgeInsets.only(
            bottom: 5,
            right: position == Alignment.centerLeft ? 50 : 5,
            left: position == Alignment.centerRight ? 50 : 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Text(
          message,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
