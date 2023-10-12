import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Images.applelogo.toWidget(),
    );
  }
}

enum _Images {
  applelogo,
}

extension _ImageExtension on _Images {
  String path() {
    return "assets/png/$name.png";
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
