import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_widget_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // appbarın her sayfada aynı olmasını istediğimiz özellikleri copywith ile yapıyoruz.
      theme: ThemeData.dark().copyWith(
          // card theme burada verilebilir
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          // colorScheme: const ColorScheme.dark(),
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0)),
      home: const CustomWidget(),
    );
  }
}
