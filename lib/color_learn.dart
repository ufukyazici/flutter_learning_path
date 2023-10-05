import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: ColorsItems.porsche, child: const Text("data")),
    );
  }
}

class ColorsItems {
  static const Color porsche = Color(0xffEDBF61);
  static const Color porsche2 = Color.fromRGBO(198, 237, 97, 1);
}
