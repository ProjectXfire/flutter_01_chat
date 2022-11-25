import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: const [
            Image(image: AssetImage("lib/assets/img/tag-logo.png")),
            SizedBox(
              height: 20,
            ),
            Text("Chatland", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
