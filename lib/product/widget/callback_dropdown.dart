import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/call_back_learn.dart';

class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({super.key, required this.onUserSelected});

  final void Function(CallbackUser user) onUserSelected;
  @override
  State<CallBackDropdown> createState() => _CallBackDropdownState();
}

class _CallBackDropdownState extends State<CallBackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? user) {
    setState(() {
      _user = user;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
        value: _user,
        items: CallbackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
