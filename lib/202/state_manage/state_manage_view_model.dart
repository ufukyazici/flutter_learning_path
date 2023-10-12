import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/state_manage/state_manage_learn_view.dart';

abstract class StateManageViewModel extends State<StateManageLearnView> {
  bool isVisible = false;
  bool isOpacity = false;
  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    isOpacity = !isOpacity;
  }

  @override
  void initState() {
    super.initState();
  }
}
