import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});
  final String _titleText = "First Application";
  final String _imagePath =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/1200px-Apple-book.svg.png";
  final String textTitle = "Create Your First Note";
  final String textDescription =
      "Add a note about anything your thoughts on climate change, or your history essay and share it with the world.";
  final String buttonText = "Create A Note";
  final String button1Text = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(_titleText),
      ),
      body: Padding(
        padding: ProjectPadding.projectPaddingHorizontal,
        child: Column(children: [
          Center(
              child: SizedBox(
                  width: 350, height: 350, child: Image.network(_imagePath))),
          const SizedBox(
            height: 10,
          ),
          _Title(textTitle: textTitle),
          _Description(textDescription: textDescription),
          const Spacer(),
          SizedBox(
            height: 60,
            child: ElevatedButton(
                onPressed: () {},
                child: Center(
                    child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ))),
          ),
          Padding(
            padding: ProjectPadding.projectPaddingBottom,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  button1Text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.blue),
                )),
          )
        ]),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    required this.textDescription,
  });

  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return Text(
      textDescription,
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.textTitle,
  });

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black),
    );
  }
}

class ProjectPadding {
  static const projectPaddingHorizontal = EdgeInsets.symmetric(horizontal: 10);
  static const projectPaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const projectPaddingBottom = EdgeInsets.only(bottom: 70);
}
