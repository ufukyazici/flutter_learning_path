import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/reqres_resource/viewModel/reqres_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(resources[index].name ?? ""),
              subtitle: Text(resources[index].year.toString()),
            ),
          );
        },
      ),
    );
  }
}
