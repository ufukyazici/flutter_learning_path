import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/call_back_learn.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_application_1/product/extension/string_extension.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
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
            actions: const [_SaveResourcesButton()],
            title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator() : null,
          ),
          floatingActionButton: const _ChangeThemeButton(),
          body: Column(
            children: [
              const _TempPlaceHolder(),
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

class _ChangeThemeButton extends StatelessWidget {
  const _ChangeThemeButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
    );
  }
}

class _SaveResourcesButton extends StatelessWidget {
  const _SaveResourcesButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<ReqresProvider>()
              .saveToLocale(context.read<ResourceContext>(), context.read<ReqresProvider>().resources);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CallBackLearn();
          }));
        },
        icon: const Icon(Icons.save));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text("data");
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
