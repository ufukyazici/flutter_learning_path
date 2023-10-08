import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Container(height: 300, color: Colors.blue),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(height: 100, color: Colors.deepPurple),
        ),
        Positioned(
            height: 100,
            width: MediaQuery.of(context).size.width,
            top: 100,
            child: Container(
              color: Colors.green,
            )),
        Positioned.fill(
            top: 150,
            child: Container(
              color: Colors.red,
            ))
      ]),
    );
  }
}
