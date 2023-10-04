import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});
  final String title = 'Welcome Back';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      title: Text(title),
    ),);
  }
}