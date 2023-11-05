import 'package:flutter/material.dart';

class NavigatorHomeDetailView extends StatefulWidget {
  const NavigatorHomeDetailView({super.key, this.id});
  final String? id;

  @override
  State<NavigatorHomeDetailView> createState() => _NavigatorHomeDetailViewState();
}

class _NavigatorHomeDetailViewState extends State<NavigatorHomeDetailView> {
  String? _id;
  @override
  void initState() {
    super.initState();
    // final modelId = ModalRoute.of(context)?.settings.arguments;
    // print(modelId);
    // _id = widget.id ?? "";
    Future.microtask(() {
      final modelId = ModalRoute.of(context)?.settings.arguments;
      print(modelId);
      setState(() {
        _id = modelId is String ? modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id ?? ""),
      ),
    );
  }
}
