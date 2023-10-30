// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/widget/button/answer_button.dart';
import 'package:flutter_application_1/product/widget/button/loading_button.dart';
import 'package:flutter_application_1/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(
            onUserSelected: (user) {
              print(user.name);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number >= 5;
            },
          ),
          LoadingButton(
            title: "Save",
            onPressed: () {
              return Future.delayed(const Duration(seconds: 2));
            },
          )
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser({required this.name, required this.id});

  static List<CallbackUser> dummyUsers() {
    return [CallbackUser(name: "ali", id: 3), CallbackUser(name: "veli", id: 2), CallbackUser(name: "cem", id: 1)];
  }

  @override
  bool operator ==(covariant CallbackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
