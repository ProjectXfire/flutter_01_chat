import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({
    Key? key,
    required this.route,
    required this.text,
    required this.textLink,
  }) : super(key: key);

  final String route;
  final String text;
  final String textLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.black26, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            textLink,
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 24,
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    ));
  }
}
