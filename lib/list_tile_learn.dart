import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const RandomImage(height: 50),
              //dense sıkıştırır
              dense: true,
              // padding verme
              //contentPadding: EdgeInsets.zero
              onTap: () {},
              subtitle: const Text("How do you use your card?"),
              //başına koymak
              leading: const Icon(Icons.money),
              // sonuna koymak
              trailing: const Icon(Icons.turn_right_rounded),
            ),
          )
        ],
      ),
    );
  }
}
