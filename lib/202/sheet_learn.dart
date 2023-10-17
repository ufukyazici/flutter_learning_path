import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backgroundColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.blue,
            barrierColor: Colors.transparent,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("data"),
                    Image.network(
                      "https://picsum.photos/200",
                      height: 200,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _backgroundColor = Colors.blue;
                          });
                        },
                        child: const Text("send"))
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
