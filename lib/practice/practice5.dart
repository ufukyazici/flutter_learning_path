import 'package:flutter/material.dart';

class Practice5 extends StatefulWidget {
  const Practice5({super.key});

  @override
  State<Practice5> createState() => _Practice5State();
}

class _Practice5State extends State<Practice5> {
  late List<ProductModel> _products;
  @override
  void initState() {
    super.initState();
    _products = ProductItems().products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ProjectPadding().paddingSymetric,
            child: _CardWidget(product: _products[index]),
          );
        },
      ),
    );
  }
}

class ProjectPadding {
  final EdgeInsets paddingSymetric = const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    required ProductModel product,
  }) : _product = product;

  final ProductModel _product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_product.name),
            Text(_product.description),
            Text(_product.price.toString()),
            Text(_product.comment),
          ],
        ),
      ),
    );
  }
}

class ProductModel {
  final String name;
  final String description;
  final int price;
  final String comment;

  ProductModel({required this.name, required this.description, required this.price, required this.comment});
}

class ProductItems {
  late List<ProductModel> products;

  ProductItems() {
    products = [
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
      ProductModel(name: "name", description: "description", price: 13, comment: "comment"),
    ];
  }
}
