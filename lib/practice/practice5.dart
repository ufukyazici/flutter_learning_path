import 'package:flutter/material.dart';

class Practice5 extends StatefulWidget {
  const Practice5({super.key});

  @override
  State<Practice5> createState() => _Practice5State();
}

class _Practice5State extends State<Practice5> {
  late List<ProductClass> products;
  @override
  void initState() {
    super.initState();
    products = ProductItems().products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
  });

  final ProductClass product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Column(
          children: [
            Text(product.name),
            Text(product.description),
            Text(product.age.toString()),
          ],
        ),
      ),
    );
  }
}

class ProductClass {
  final String name;
  final String description;
  final int age;
  final bool gender;

  ProductClass({required this.name, required this.description, required this.age, required this.gender});
}

class ProductItems {
  late List<ProductClass> products;

  ProductItems() {
    products = [
      ProductClass(name: "name", description: "description", age: 23, gender: true),
      ProductClass(name: "name", description: "description", age: 23, gender: true),
      ProductClass(name: "name", description: "description", age: 23, gender: true),
      ProductClass(name: "name", description: "description", age: 23, gender: true),
      ProductClass(name: "name", description: "description", age: 23, gender: true),
    ];
  }
}
