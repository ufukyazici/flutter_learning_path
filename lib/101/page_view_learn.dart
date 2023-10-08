import 'package:flutter/material.dart';
import 'package:flutter_application_1/card_learn.dart';
import 'package:flutter_application_1/color_learn.dart';
import 'package:flutter_application_1/icon_learn.dart';
import 'package:flutter_application_1/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentIndex = 0;
  void _updatePageIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        onPageChanged: _updatePageIndex,
        padEnds: false,
        controller: _pageController,
        children: [
          const CardLearn(),
          const ColorLearn(),
          IconLearn(),
          const StackLearn(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_currentIndex.toString()),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(duration: _DurationUtility.pageDuration, curve: Curves.slowMiddle);
            },
            child: const Icon(Icons.chevron_left_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: _DurationUtility.pageDuration, curve: Curves.slowMiddle);
            },
            child: const Icon(Icons.chevron_right_outlined),
          ),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const pageDuration = Duration(seconds: 1);
}
