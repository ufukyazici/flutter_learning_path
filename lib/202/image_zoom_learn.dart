import 'package:flutter/material.dart';

class ImageZoomLearn extends StatefulWidget {
  const ImageZoomLearn({super.key});

  @override
  State<ImageZoomLearn> createState() => _ImageZoomLearnState();
}

class _ImageZoomLearnState extends State<ImageZoomLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                child: InteractiveViewer(
                  child: Image.asset(
                    "assets/png/applelogo.png",
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
