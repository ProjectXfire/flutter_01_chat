import 'package:flutter/material.dart';
import 'package:flutter_02_chat/modules/auth/screens/login.dart';
import 'package:flutter_02_chat/modules/chat/screens/users.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:flutter_02_chat/modules/auth/providers/auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final isAuthenticated = await authProvider.isLoggedIn();
    if (!mounted) return;
    if (isAuthenticated) {
      // TODO: Socket
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 0),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  UsersScreen()));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 0),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LoginScreen()));
    }
  }
}
