import 'package:flutter/material.dart';
import 'package:flutter_02_chat/modules/auth/providers/auth.dart';
// Routes
import 'package:flutter_02_chat/routes.dart';
// Providers
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme:
            ThemeData(primarySwatch: Colors.blue, fontFamily: "akaya-kanadaka"),
        initialRoute: "loading",
        routes: AppRoutes.generateRoutes(),
      ),
    );
  }
}
