import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/navigate_detail_learn.dart';

class NavigatorLearn extends StatefulWidget {
  const NavigatorLearn({super.key});

  @override
  State<NavigatorLearn> createState() => _NavigatorLearnState();
}

//push pop popup en çok kullanılanlar
class _NavigatorLearnState extends State<NavigatorLearn> with NavigatorManager {
  List<int> indexList = [];

  void appendList(int index) {
    setState(() {
      indexList.add(index);
    });
  }

  void removeList(int index) {
    setState(() {
      indexList.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal(
                  context,
                  NavigateLearnDart(
                    isOkey: indexList.contains(index),
                  ));
              if (response == true) {
                appendList(index);
              } else if (response == false) {
                removeList(index);
              }
            },
            child: Placeholder(
              color: indexList.contains(index) ? Colors.green : Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToWidget(context, const NavigateLearnDart());
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

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        //pencere olarak açar
        fullscreenDialog: true,
        settings: const RouteSettings()));
  }
}
