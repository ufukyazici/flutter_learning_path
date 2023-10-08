import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  ImageLearn({super.key});
  final String imageUrl =
      "https://www.shareicon.net/data/512x512/2016/09/01/822957_apple_512x512.png";
  final ImageItems imageItems = ImageItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 300,
          width: 300,
          child: PngImage(path: imageItems.appleBook),
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) =>
                const CircularProgressIndicator(color: Colors.deepPurple),
          ),
        ),
      ]),
    );
  }
}

class ImageItems {
  final String appleBook3 = "5593976";
  final String appleBook = "822957";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => "assets/png/$path.png";
}
