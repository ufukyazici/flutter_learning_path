import 'package:flutter/material.dart';
import 'package:flutter_application_1/practice/practice2.dart';

class Practice3 extends StatefulWidget {
  const Practice3({super.key});

  @override
  State<Practice3> createState() => _Practice3State();
}

class _Practice3State extends State<Practice3> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = Colors.pink;
                });
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Practice2(
              initializedColor: _backgroundColor,
            ),
          )
        ],
      ),
    );
  }
}
