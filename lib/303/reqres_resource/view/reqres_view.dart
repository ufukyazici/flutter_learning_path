import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_application_1/product/extension/string_extension.dart';
import 'package:flutter_application_1/product/global/theme_notifier.dart';
import 'package:flutter_application_1/product/service/projectDio.dart';
import 'package:provider/provider.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

// class _ReqResViewState extends ReqresViewModel {
class _ReqResViewState extends State<ReqResView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ResourceService(dio: service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator() : null,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          body: Column(
            children: [
              Selector<ReqresProvider, bool>(builder: (context, value, child) {
                return value ? const Placeholder() : const Text("data");
              }, selector: (context, provider) {
                return provider.isLoading;
              }),
              Expanded(child: _resourceListView(context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: ListTile(
            title: Text(items[index].name ?? ""),
            subtitle: Text(items[index].year.toString()),
          ),
        );
      },
    );
  }
}
