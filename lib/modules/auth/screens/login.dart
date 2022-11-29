import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_02_chat/modules/auth/widgets/_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(),
                LoginForm(),
                Labels(
                  route: "register",
                  text: "Do not have an account?",
                  textLink: "Create an account now!",
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
