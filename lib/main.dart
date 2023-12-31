import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/404/bloc/feature/login/view/login_view.dart';
import 'package:flutter_application_1/404/compute/compute_learn.dart';
import 'package:flutter_application_1/product/constant/project_items.dart';
import 'package:flutter_application_1/product/global/theme_notifier.dart';
import 'package:flutter_application_1/product/init/product_init.dart';
import 'package:flutter_application_1/product/navigator/navigator_custom.dart';
import 'package:flutter_application_1/product/navigator/navigator_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();

  runApp(EasyLocalization(
      supportedLocales: productInit.localizationInit.supportedLocales,
      path: productInit.localizationInit.localizationPath, // <-- change the path of the translation files
      child: MultiProvider(
        providers: productInit.providers,
        builder: (context, child) => const MyApp(),
      )));
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child ?? const SizedBox());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const LoginViewAdvance();
        });
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: NavigatorCustom().onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorKey,
      home: const ComputeLearnView(),
    );
  }
}
