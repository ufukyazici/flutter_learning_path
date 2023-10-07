import 'package:flutter/material.dart';
import 'package:flutter_application_1/practice/practice3.dart';

class NavigatorLearn extends StatefulWidget {
  const NavigatorLearn({super.key});

  @override
  State<NavigatorLearn> createState() => _NavigatorLearnState();
}

//push pop popup en çok kullanılanlar
class _NavigatorLearnState extends State<NavigatorLearn> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToWidget(context, const Practice3());
        },
        child: const Icon(Icons.navigation_rounded),
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        //pencere olarak açar
        fullscreenDialog: true,
        settings: const RouteSettings()));
  }
}
