import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_02_chat/modules/shared/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.email_outlined,
              placeholder: "example@email.com",
              keyboardType: TextInputType.emailAddress,
              controller: emailCtrl),
          CustomInput(
              icon: Icons.lock,
              placeholder: "*****************",
              keyboardType: TextInputType.text,
              isPassword: true,
              controller: passwordCtrl),
          CustomButton(
            title: "Login",
            onPress: () {
              print(emailCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
