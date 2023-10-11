import 'package:flutter/material.dart';

class AlbumTheme {
  final theme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple))));
}
