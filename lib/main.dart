import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/product/constant/project_items.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:flutter_application_1/product/global/theme_notifier.dart';
import 'package:flutter_application_1/product/navigator/navigator_custom.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
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
      title: ProjectItems.projectName,
      // appbarın her sayfada aynı olmasını istediğimiz özellikleri copywith ile yapıyoruz.
      theme: context.watch<ThemeNotifier>().currentTheme,
      // ThemeData.dark().copyWith(
      //     //projedeki tüm titleMediumların rengini düzenleme
      //     // textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
      //     //input fieldleri özelleştirme
      //     inputDecorationTheme: const InputDecorationTheme(
      //       //filled: true,
      //       //fillColor: Colors.red,
      //       iconColor: Colors.white,
      //       border: OutlineInputBorder(),
      //       //floatingLabelStyle: TextStyle(color: Colors.black)
      //     ),
      //     listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //     // progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.deepPurple),
      //     // card theme burada verilebilir
      //     cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      //     // colorScheme: const ColorScheme.dark(),
      //     appBarTheme: const AppBarTheme(centerTitle: true, backgroundColor: Colors.transparent, elevation: 0)),
      // initialRoute: "/",
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const LottieLearn();
        });
      },
      routes: NavigatorRoutes().items,
      onGenerateRoute: NavigatorCustom().onGenerateRoute,
      // home: const SharedLearn(),
    );
  }
}
