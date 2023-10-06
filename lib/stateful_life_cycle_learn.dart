import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key, required this.message});
  final String message;

  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.message.length.isOdd ? const Text("tek") : const Text("çift"),
      ),
      body: widget.message.length.isOdd
          ? TextButton(onPressed: () {}, child: Text(widget.message))
          : ElevatedButton(onPressed: () {}, child: const Text("sa")),
    );
  }
}
