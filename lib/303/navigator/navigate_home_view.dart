import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

class NavigatorHomeView extends StatelessWidget {
  const NavigatorHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.of(context).pushNamed(NavigateRoutes.detail.getRoutePath, arguments: "abc");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
