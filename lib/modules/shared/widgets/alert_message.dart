import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showCustomAlert(BuildContext context, String title, String subtitle) {
  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              content: Text(subtitle,
                  style: const TextStyle(color: Colors.redAccent)),
              actions: [
                MaterialButton(
                  elevation: 5,
                  textColor: Colors.blueAccent,
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                )
              ],
            ));
  }
  showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            content:
                Text(subtitle, style: const TextStyle(color: Colors.redAccent)),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ));
}
