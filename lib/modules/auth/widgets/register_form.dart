import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:flutter_02_chat/modules/auth/providers/_providers.dart';
// Widgets
import 'package:flutter_02_chat/modules/shared/widgets/_widgets.dart';

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
    final authProvider = Provider.of<AuthProvider>(context);

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
            onPress: () async {
              final email = emailCtrl.text.trim();
              final password = passwordCtrl.text.trim();
              final username = usernameCtrl.text.trim();
              if (email.isEmpty && password.isEmpty && username.isEmpty) return;
              final loginOk =
                  await authProvider.register(username, email, password);
              if (!mounted) return;
              FocusScope.of(context).unfocus();
              if (loginOk != true) {
                showCustomAlert(context, "Error on login", loginOk);
              } else {
                // TODO: Socket server
                Navigator.pushReplacementNamed(context, "users");
              }
            },
          )
        ],
      ),
    );
  }
}
