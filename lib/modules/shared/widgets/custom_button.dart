import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPress;

  const CustomButton({Key? key, required this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 2, shape: const StadiumBorder()),
        onPressed: onPress,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 24),
          )),
        ));
  }
}
