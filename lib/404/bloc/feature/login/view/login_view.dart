import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginViewAdvance extends StatefulWidget {
  const LoginViewAdvance({super.key});

  @override
  State<LoginViewAdvance> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginViewAdvance> {
  final String _loginText = "Login";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formLoginKey,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) => value.ext.isValidEmail ? null : "Email is not valid",
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  obscureText: _isVisible,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: _changeVisibility,
                          icon: Icon(_isVisible ? Icons.visibility_off : Icons.visibility))),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formLoginKey.currentState?.validate() ?? false) {}
                        },
                        child: Text(_loginText)))
              ],
            ),
          )),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
}
