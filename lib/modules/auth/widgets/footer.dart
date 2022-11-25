import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Terms and Conditions",
      style: TextStyle(color: Colors.black26, fontSize: 18),
    );
  }
}
