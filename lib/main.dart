import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/model_learn_view.dart';

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
          //projedeki tüm titleMediumların rengini düzenleme
          // textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
          //input fieldleri özelleştirme
          inputDecorationTheme: const InputDecorationTheme(
            //filled: true,
            //fillColor: Colors.red,
            iconColor: Colors.white,
            border: OutlineInputBorder(),
            //floatingLabelStyle: TextStyle(color: Colors.black)
          ),
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.deepPurple),
          // card theme burada verilebilir
          cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          // colorScheme: const ColorScheme.dark(),
          appBarTheme: const AppBarTheme(centerTitle: true, backgroundColor: Colors.transparent, elevation: 0)),
      home: const ModelLearn(),
    );
  }
}
