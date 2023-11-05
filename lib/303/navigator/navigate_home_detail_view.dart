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
    _id = widget.id;
    if (_id == null) {
      Future.microtask(() {
        final modelId = ModalRoute.of(context)?.settings.arguments;
        print(modelId);
        setState(() {
          _id = modelId is String ? modelId : widget.id;
        });
      });
    }
    // final modelId = ModalRoute.of(context)?.settings.arguments;
    // print(modelId);
    // _id = widget.id ?? "";
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
