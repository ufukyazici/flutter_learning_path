import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          FittedBox(
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          Container(color: Colors.red, height: 300),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.red, width: 100),
                Container(color: Colors.blue, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.blue, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.blue, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.blue, width: 100),
                Container(color: Colors.red, width: 100),
                Container(color: Colors.blue, width: 100),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.accessible_forward_outlined)),
          //sayfa altına geldiğinde bu kısım tekrar yazılır yukarı çıkınca dispose edilir.
          const _ListViewDemo()
        ],
      ),
    );
  }
}

class _ListViewDemo extends StatefulWidget {
  const _ListViewDemo();

  @override
  State<_ListViewDemo> createState() => __ListViewDemoState();
}

class __ListViewDemoState extends State<_ListViewDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
