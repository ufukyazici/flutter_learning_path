import 'package:flutter/material.dart';

class AccountsTheme {
  final theme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.white),
          color: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20)))),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.black));
}
