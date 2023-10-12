import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/state_manage/state_manage_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateManageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeOpacity();
        changeVisible();
      }),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.deepPurple,
        actions: [isVisible ? const Icon(Icons.accessible_forward_outlined) : const Icon(Icons.home)],
      ),
    );
  }
}
