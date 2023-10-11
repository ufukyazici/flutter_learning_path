import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;
  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
        textTheme:
            ThemeData.light().textTheme.copyWith(labelMedium: TextStyle(fontSize: 100, color: _lightColor._textColor)),
        checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.deepPurple)));
  }
}

class _LightColor {
  final Color _textColor = Colors.redAccent;
}
