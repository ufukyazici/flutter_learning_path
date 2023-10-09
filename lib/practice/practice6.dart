import 'package:flutter/material.dart';
import 'package:flutter_application_1/practice/practice5.dart';

class Practice6 extends StatefulWidget {
  const Practice6({super.key});

  @override
  State<Practice6> createState() => _Practice6State();
}

class _Practice6State extends State<Practice6> {
  List<int> indexes = [];
  void addIndex(int index) {
    setState(() {
      indexes.add(index);
    });
  }

  void removeIndex(int index) {
    setState(() {
      indexes.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return TextButton(
              onPressed: () async {
                final response = await _navigateManager(
                    context,
                    Practice5(
                      isOkey: indexes.contains(index),
                    ));
                if (response == true) {
                  addIndex(index);
                } else if (response == false) {
                  removeIndex(index);
                }
              },
              child: Placeholder(
                color: indexes.contains(index) ? Colors.green : Colors.red,
              ));
        },
      ),
    );
  }

  Future<T?> _navigateManager<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
        settings: const RouteSettings()));
  }
}
