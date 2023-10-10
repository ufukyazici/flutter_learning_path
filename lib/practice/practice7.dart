import 'package:flutter/material.dart';

class Practice7 extends StatefulWidget {
  const Practice7({super.key, this.isOkey = false});
  final bool isOkey;

  @override
  State<Practice7> createState() => _Practice7State();
}

class _Practice7State extends State<Practice7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              icon: const Icon(Icons.check),
              label: Text(widget.isOkey ? "Reddet" : "Onayla"))),
    );
  }
}
