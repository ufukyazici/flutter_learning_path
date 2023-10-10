import 'package:flutter/material.dart';
import 'package:flutter_application_1/practice/practice7.dart';

class Practice8 extends StatefulWidget {
  const Practice8({super.key});

  @override
  State<Practice8> createState() => _Practice8State();
}

class _Practice8State extends State<Practice8> {
  List<int> indexes = [];
  void indexController(int index) {
    if (indexes.contains(index)) {
      setState(() {
        indexes.remove(index);
      });
    } else {
      setState(() {
        indexes.add(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () async {
                final response = await _navigatorController(context, index);
                if (response != null) {
                  indexController(index);
                }
              },
              child: Placeholder(
                color: indexes.contains(index) ? Colors.green : Colors.red,
              ));
        },
      ),
    );
  }

  Future<T?> _navigatorController<T>(BuildContext context, int index) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
      fullscreenDialog: true,
      settings: const RouteSettings(),
      builder: (context) {
        return Practice7(
          isOkey: indexes.contains(index),
        );
      },
    ));
  }
}
