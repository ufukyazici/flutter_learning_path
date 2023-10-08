import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(flex: 4, child: Container(color: Colors.red)),
          const Spacer(flex: 2),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              //kaplayabileceği en küçük alanı kaplaması
              //mainAxisSize: MainAxisSize.min,
              children: [
                Text("sa"),
                Text("as"),
                Text("nbr"),
              ],
            ),
          ),
          Expanded(flex: 2, child: Container(color: Colors.orange)),
          Expanded(flex: 4, child: Container(color: Colors.blue)),
        ],
      ),
    );
  }
}
