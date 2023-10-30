// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  CallbackUser? _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DropdownButton<CallbackUser>(
              value: _user,
              items: CallbackUser.dummyUsers().map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (CallbackUser? callbackUser) {
                setState(() {
                  _user = callbackUser;
                });
              })
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
