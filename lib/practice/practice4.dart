import 'package:flutter/material.dart';

class Practice4 extends StatefulWidget {
  const Practice4({super.key});

  @override
  State<Practice4> createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  late List<CollectionModel> _items;
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: const Text("Shops"),
          leading: const Icon(Icons.settings),
          actions: [Padding(padding: ProjectPadding().paddingRight, child: const Icon(Icons.search))]),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: ProjectPadding().paddingHorizontal,
            child: _ShopCategoryWidget(model: _items[index]),
          );
        },
      ),
    );
  }
}

class _ShopCategoryWidget extends StatelessWidget {
  const _ShopCategoryWidget({
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Padding(
          padding: ProjectPadding().paddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(children: [
                  Text(_model.title, style: Theme.of(context).textTheme.titleLarge),
                  Padding(
                    padding: ProjectPadding().paddingTopSmall,
                    child: Text(_model.subtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey)),
                  )
                ]),
                Image.network(
                  _model.imagePath,
                  height: 40,
                )
              ]),
              const Spacer(),
              Padding(
                padding: ProjectPadding().paddingBottom,
                child: Text(_model.closingTime,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.green)),
              ),
              Text(_model.address, style: Theme.of(context).textTheme.titleLarge)
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String title;
  final String subtitle;
  final String closingTime;
  final String imagePath;
  final String address;

  CollectionModel({
    required this.title,
    required this.subtitle,
    required this.closingTime,
    required this.imagePath,
    required this.address,
  });
}

class ProjectPadding {
  final EdgeInsets paddingBottom = const EdgeInsets.only(bottom: 12);
  final EdgeInsets paddingTopSmall = const EdgeInsets.only(top: 4);
  final EdgeInsets paddingAll = const EdgeInsets.all(20);
  final EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 10);
  final EdgeInsets paddingRight = const EdgeInsets.only(right: 8);
}

class CollectionItems {
  final imageUrl =
      "https://www.citypng.com/public/uploads/small/11641483246eqwszxuz6qkpptrrcxwqtzgz8mcu9r6sihgiv3ak1sppvc04oczascwtchlstjbdssaks7h7sxhk1ifuu57ggmpfx38nmhu3lyox.png";
  late List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
          title: "Bean and leaf",
          subtitle: "Coffee Shop",
          closingTime: "Open 24 hrs",
          imagePath: imageUrl,
          address: "Bolshoy prospect, Petrogradskaya storona,, 126"),
      CollectionModel(
          title: "Bean and leaf",
          subtitle: "Coffee Shop",
          closingTime: "Open 24 hrs",
          imagePath: imageUrl,
          address: "Bolshoy prospect, Petrogradskaya storona,, 126"),
      CollectionModel(
          title: "Bean and leaf",
          subtitle: "Coffee Shop",
          closingTime: "Open 24 hrs",
          imagePath: imageUrl,
          address: "Bolshoy prospect, Petrogradskaya storona,, 126"),
      CollectionModel(
          title: "Bean and leaf",
          subtitle: "Coffee Shop",
          closingTime: "Open 24 hrs",
          imagePath: imageUrl,
          address: "Bolshoy prospect, Petrogradskaya storona,, 126"),
      CollectionModel(
          title: "Bean and leaf",
          subtitle: "Coffee Shop",
          closingTime: "Open 24 hrs",
          imagePath: imageUrl,
          address: "Bolshoy prospect, Petrogradskaya storona,, 126")
    ];
  }
}
