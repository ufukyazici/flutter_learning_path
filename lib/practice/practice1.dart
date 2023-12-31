import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/icon_learn.dart';
import 'package:flutter_application_1/101/indicator_learn.dart';
import 'package:flutter_application_1/101/stack_learn.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class Practice1 extends StatefulWidget {
  const Practice1({super.key, this.userName});
  final String? userName;

  @override
  State<Practice1> createState() => _Practice1State();
}

class _Practice1State extends State<Practice1> {
  String _message = "";
  late bool userAuthorized;

  @override
  void initState() {
    super.initState();
    _userNameCheck();
  }

  void _userNameCheck() {
    widget.userName != null ? _message += "Merhaba ${widget.userName}" : _message = "You aren't authorized";
    widget.userName != null ? userAuthorized = true : userAuthorized = false;
  }

  @override
  void didUpdateWidget(covariant Practice1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _message = "";
    _userNameCheck();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: Center(
        child: userAuthorized
            ? PageView(
                children: [const IndicatorLearn(), const StackLearn(), IconLearn()],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(LanguageItems.signUp),
                  ElevatedButton(onPressed: () {}, child: const Text(LanguageItems.signUpButton))
                ],
              ),
      ),
    );
  }
}
