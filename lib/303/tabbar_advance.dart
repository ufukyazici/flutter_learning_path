import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/card_learn.dart';
import 'package:flutter_application_1/101/color_learn.dart';
import 'package:flutter_application_1/303/feed_view.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({super.key});

  @override
  State<TabbarAdvanceLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabbarAdvanceLearn> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabs.values.length,
        child: Scaffold(
            body: _myTabbarView(),
            floatingActionButton: FloatingActionButton(onPressed: () => _navigatorController(context)),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar:
                BottomAppBar(notchMargin: 10, shape: const CircularNotchedRectangle(), child: _myTabView())));
  }

  TabBarView _myTabbarView() {
    return const TabBarView(
      children: [FeedView(), CardLearn()],
    );
  }

  void _navigatorController(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const ColorLearn();
      },
    ));
  }

  TabBar _myTabView() {
    return TabBar(
        tabs: _MyTabs.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }
}

enum _MyTabs { home, settings }
