import 'package:flutter/material.dart';

class NavigateLearnDart extends StatefulWidget {
  const NavigateLearnDart({super.key, this.isOkey = false});
  final bool isOkey;

  @override
  State<NavigateLearnDart> createState() => _NavigateLearnDartState();
}

class _NavigateLearnDartState extends State<NavigateLearnDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  widget.isOkey ? Navigator.of(context).pop(false) : Navigator.of(context).pop(true);
                },
                icon: const Icon(Icons.check),
                label: Text(widget.isOkey ? "Reddet" : "Onayla")),
          ],
        ),
      ),
    );
  }
}
