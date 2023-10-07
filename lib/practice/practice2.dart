import 'package:flutter/material.dart';

class Practice2 extends StatefulWidget {
  const Practice2({super.key, this.initializedColor});
  final Color? initializedColor;

  @override
  State<Practice2> createState() => _Practice2State();
}

class _Practice2State extends State<Practice2> {
  Color? _backgroundColor = Colors.transparent;
  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initializedColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant Practice2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_backgroundColor != widget.initializedColor && widget.initializedColor != null) {
      _backgroundColor = widget.initializedColor;
    }
  }

  void changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(onTap: _backgroundColorOnTap, items: const [
        BottomNavigationBarItem(icon: _ContainerColor(color: Colors.red), label: "Red"),
        BottomNavigationBarItem(icon: _ContainerColor(color: Colors.yellow), label: "Yellow"),
        BottomNavigationBarItem(icon: _ContainerColor(color: Colors.blue), label: "Blue"),
      ]),
    );
  }

  void _backgroundColorOnTap(value) {
    if (value == ColorList.red.index) {
      changeColor(Colors.red);
    } else if (value == ColorList.yellow.index) {
      changeColor(Colors.yellow);
    } else if (value == ColorList.blue.index) {
      changeColor(Colors.blue);
    }
  }
}

enum ColorList {
  red,
  yellow,
  blue,
}

class _ContainerColor extends StatelessWidget {
  const _ContainerColor({
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 10, height: 10, color: color);
  }
}
