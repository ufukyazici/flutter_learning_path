import 'package:flutter/material.dart';
import 'package:flutter_application_1/jsonphalbums/album_language.dart';
import 'package:flutter_application_1/jsonphalbums/home_page.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

//login aktif degil sadece ogrendiklerimi test etmek icin
class _LoginViewState extends State<LoginView> {
  bool _isSecure = true;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _changeSecurity() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AlbumLanguage().appBarLogin),
      ),
      body: Padding(
        padding: _PagePaddings()._paddingHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _mailTextField(),
            Padding(
              padding: _PagePaddings()._paddingOnlyTop,
              child: _passwordTextField(),
            ),
            Padding(
              padding: _PagePaddings()._paddingOnlyTop,
              child: _LoginButton(
                  buttonIcon: const Icon(Icons.login_outlined),
                  buttonText: AlbumLanguage().loginButton),
            ),
            Padding(
                padding: _PagePaddings()._paddingOnlyTop,
                child: _LoginButton(
                  buttonIcon: const Icon(Icons.app_registration_rounded),
                  buttonText: AlbumLanguage().registerButton,
                )),
          ],
        ),
      ),
    );
  }

  TextField _mailTextField() {
    return TextField(
      controller: _mailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: LanguageItems.mail,
        suffix:
            IconButton(onPressed: () {}, icon: const Icon(Icons.mail_outlined)),
      ),
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: _passwordController,
      obscureText: _isSecure,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: LanguageItems.password,
        suffix: IconButton(
            onPressed: () {
              _changeSecurity();
            },
            icon: AnimatedCrossFade(
                firstChild: const Icon(Icons.visibility_outlined),
                secondChild: const Icon(Icons.visibility_off_outlined),
                crossFadeState: _isSecure
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1))),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.buttonIcon,
    required this.buttonText,
  });
  final Icon buttonIcon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton.icon(
          onPressed: () {
            if (buttonText == "Login") {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            }
          },
          icon: buttonIcon,
          label: Center(child: Text(buttonText))),
    );
  }
}

class _PagePaddings {
  final EdgeInsets _paddingOnlyTop = const EdgeInsets.only(top: 20);
  final EdgeInsets _paddingHorizontal =
      const EdgeInsets.symmetric(horizontal: 25);
}
