import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_02_chat/modules/auth/widgets/_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                RegisterForm(),
                Labels(
                  route: "login",
                  text: "Already have an account?",
                  textLink: "Login here",
                ),
                Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
