import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});
  final _cardHeight = 80.0;
  final _cardWidth = 300.0;

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
                    bottom: _cardHeight / 2,
                    child: Image.network("https://fotolifeakademi.com/uploads/2020/04/manzara-fotografi-cekmek.jpg"),
                  ),
                  Positioned(height: _cardHeight, width: _cardWidth, bottom: 0, child: const _CardWidget())
                ],
              )),
          const Spacer(flex: 6)
        ],
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(),
      color: Colors.white,
      child: Text(
        "sadsdasdasdad",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
      ),
    );
  }
}
