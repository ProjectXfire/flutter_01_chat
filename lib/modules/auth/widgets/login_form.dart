import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import 'package:flutter_02_chat/modules/auth/providers/auth.dart';
// Widgets
import 'package:flutter_02_chat/modules/shared/widgets/_widgets.dart';

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
    final authProvider = Provider.of<AuthProvider>(context);

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
            onPress: authProvider.getAuthenticating
                ? null
                : () async {
                    final email = emailCtrl.text.trim();
                    final password = passwordCtrl.text.trim();
                    if (email.isEmpty && password.isEmpty) return;
                    final loginOk = await authProvider.login(email, password);
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
