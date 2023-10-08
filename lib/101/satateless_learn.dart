import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("sa")),
        body: const Column(
          children: [
            TitleTextWidget(title: "ProductName"),
            _EmptyBox(),
            TitleTextWidget(title: "Description"),
            _EmptyBox(),
            TitleTextWidget(title: "Price"),
            _EmptyBox(),
            TitleTextWidget(title: "Comments"),
            _CustomContainer(),
            _EmptyBox()
          ],
        ));
  }
}

class _EmptyBox extends StatelessWidget {
  const _EmptyBox();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

// _ private yapar
class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
