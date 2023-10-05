import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final String appTitle = "First Project";
  final String imagePath =
      "https://www.shareicon.net/data/512x512/2016/09/01/822957_apple_512x512.png";
  final String textTitle = "Create Your First Note";
  final String textDescription =
      "Add a note about anything your thoughts on climate change, or your history essay and share it with the world.";
  final String buttonText = "Create A Note";
  final String button1Text = "Import Notes";
  final ProjectPadding projectPadding = ProjectPadding();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Padding(
        padding: projectPadding.pagePaddingVertical,
        child: Column(children: [
          Image(image: NetworkImage(imagePath), height: 300),
          Padding(
              padding: projectPadding.pagePaddingElements,
              child: Text(textTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.black))),
          Padding(
            padding: projectPadding.pagePaddingElements,
            child: Text(
              textDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          _CreateNoteButton(buttonText: buttonText),
          TextButton(onPressed: () {}, child: Text(button1Text))
        ]),
      ),
    );
  }
}

class _CreateNoteButton extends StatelessWidget {
  const _CreateNoteButton({
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(buttonText,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(horizontal: 30);
  final pagePaddingElements = const EdgeInsets.only(top: 10);
}
