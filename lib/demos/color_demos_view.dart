//bir ekran olucak
//bu ekranda 3 button ve bunlara basinca denk değişimi olucak
//secili olan button selected icon olucak
import 'package:flutter/material.dart';

class ColorDemo extends StatefulWidget {
  const ColorDemo({super.key, this.initializedColor});
  final Color? initializedColor;

  @override
  State<ColorDemo> createState() => _ColorDemoState();
}

class _ColorDemoState extends State<ColorDemo> {
  Color? _backgroundColor = Colors.transparent;
  @override
  void initState() {
    super.initState();
    if (widget.initializedColor != null) {
      _backgroundColor = widget.initializedColor ?? Colors.transparent;
    }
  }

  @override
  void didUpdateWidget(covariant ColorDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_backgroundColor != widget.initializedColor && widget.initializedColor != null) {
      setState(() {
        changeBackgroundColor(widget.initializedColor!);
      });
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(icon: _ContainerWidget(color: Colors.red), label: "Red"),
        BottomNavigationBarItem(icon: _ContainerWidget(color: Colors.yellow), label: "Yellow"),
        BottomNavigationBarItem(icon: _ContainerWidget(color: Colors.blue), label: "Blue"),
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}

class ProjectColors {
  final Color blueColor = Colors.blue;
  final Color greenColor = Colors.green;
  final Color yellowColor = Colors.yellow;
}
