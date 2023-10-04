import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainview.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SCAFFOLD LEARN",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,),
      body: const Text("salam dunya"),
      floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => const MainView()),
  );
      },
      child: const Icon(Icons.abc),),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc),label: "a"),
        BottomNavigationBarItem(icon: Icon(Icons.accessibility_new_outlined),label: "b"),
      ]),
    );
  }
}