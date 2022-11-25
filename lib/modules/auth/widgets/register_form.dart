import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_02_chat/modules/shared/widgets/widgets.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final usernameCtrl = TextEditingController();
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
              icon: Icons.person,
              placeholder: "username",
              keyboardType: TextInputType.text,
              controller: usernameCtrl),
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
            title: "Register",
            onPress: () {
              print(emailCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
