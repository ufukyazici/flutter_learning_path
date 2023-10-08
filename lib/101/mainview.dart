import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sa"),
        centerTitle: true,
        leading: const Padding(
          padding:  EdgeInsets.all(8.0),
          child:  CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/57.jpg")),
        ),
        actions: const [Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("<===="),
        )],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_sharp),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
