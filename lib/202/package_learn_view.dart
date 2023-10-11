import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/package/loading_bar.dart';
import 'package:shimmer/shimmer.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({super.key});

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}

class _PackageLearnState extends State<PackageLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Shimmer.fromColors(
          baseColor: Colors.deepPurple,
          highlightColor: Colors.white,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const ListTile(title: Text("SA"), subtitle: LoadingBar());
            },
          )),
    );
  }
}
