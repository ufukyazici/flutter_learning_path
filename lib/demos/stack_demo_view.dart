import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                      child: Image.network("https://fotolifeakademi.com/uploads/2020/04/manzara-fotografi-cekmek.jpg")),
                  Positioned(
                      height: 50,
                      width: 300,
                      bottom: 0,
                      child: Card(
                        shape: const RoundedRectangleBorder(),
                        color: Colors.white,
                        child: Text(
                          "sadsdasdasdad",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        ),
                      ))
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }
}
