import 'package:flutter/material.dart';

class MyCollectionsDemo extends StatefulWidget {
  const MyCollectionsDemo({super.key});

  @override
  State<MyCollectionsDemo> createState() => _MyCollectionsDemoState();
}

class _MyCollectionsDemoState extends State<MyCollectionsDemo> {
  late List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: ProjectPadding().paddingHorizontal,
        itemBuilder: (context, index) {
          return _CategoryWidget(model: _items[index]);
        },
        itemCount: _items.length,
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectPadding().paddingBottom,
      child: Padding(
        padding: ProjectPadding().paddingAll,
        child: Column(
          children: [
            Image.network(
              _model.imagePath,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: ProjectPadding().paddingOnlyTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(_model.title), Text("${_model.price.toString()} ETH")],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class ProjectPadding {
  final EdgeInsets paddingOnlyTop = const EdgeInsets.only(top: 10);
  final EdgeInsets paddingAll = const EdgeInsets.all(20);
  final EdgeInsets paddingBottom = const EdgeInsets.only(bottom: 40);
  final EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems {
  final imageUrl =
      "https://upload.wikimedia.org/wikipedia/commons/f/f6/Pixel_DJ_Soft_Skull_%26_Headphones_-_Black_BG%3B_800%25_Pixel%3B_400x400.png";
  late List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art", price: 3.4),
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art2", price: 3.4),
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art3", price: 3.4),
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art4", price: 3.4),
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art5", price: 3.4),
      CollectionModel(imagePath: imageUrl, title: "Abstracr Art6", price: 3.4),
    ];
  }
}
