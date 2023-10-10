import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class Practice9 extends StatefulWidget {
  const Practice9({super.key});

  @override
  State<Practice9> createState() => _Practice9State();
}

class _Practice9State extends State<Practice9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              _MailTextField(),
              _PasswordTextField(),
              _ElevatedButtonWidget(
                  buttonText: LanguageItems.login, buttonColor: Colors.green, buttonIcon: Icon(Icons.login)),
              _ElevatedButtonWidget(
                  buttonText: LanguageItems.register,
                  buttonColor: Colors.deepPurple,
                  buttonIcon: Icon(Icons.app_registration_rounded))
            ],
          ),
        ),
      ),
    );
  }
}

class _ElevatedButtonWidget extends StatelessWidget {
  const _ElevatedButtonWidget({required this.buttonText, required this.buttonColor, required this.buttonIcon});
  final String buttonText;
  final Color buttonColor;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
        onPressed: () {},
        icon: buttonIcon,
        label: Center(child: Text(buttonText)));
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      maxLength: 30,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: LanguageItems.password,
        prefixIcon: Icon(Icons.password),
      ),
    );
  }
}

class _MailTextField extends StatelessWidget {
  const _MailTextField();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      maxLength: 30,
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: LanguageItems.mail,
        prefixIcon: Icon(Icons.mail),
      ),
    );
  }
}
