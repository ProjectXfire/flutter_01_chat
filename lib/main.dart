import 'package:flutter/material.dart';
// Routes
import 'package:flutter_02_chat/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: "akaya-kanadaka"),
      initialRoute: "login",
      routes: AppRoutes.generateRoutes(),
    );
  }
}
