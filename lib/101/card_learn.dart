import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Learn"),
      ),
      body: Column(children: [
        _CustomCard(
            child: const SizedBox(
          height: 100,
          width: 300,
          child: Center(child: Text("Süleyman")),
        )),
        Card(
          shape: const StadiumBorder(),
          color: Theme.of(context).colorScheme.error,
          margin: ProjectMargin.cardMargin,
          child: const SizedBox(
            height: 100,
            width: 300,
          ),
        ),
        _CustomCard(
            child: const SizedBox(
          height: 100,
          width: 300,
          child: Center(child: Text("Süleyman")),
        )),
      ]),
    );
  }
}

class ProjectMargin {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  _CustomCard({required this.child});
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargin.cardMargin,
      child: child,
    );
  }
}

//borders
//StadiumBorder(),CircleBorder(),RoundedRectangleBorder(),