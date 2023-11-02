import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';

class ReqresProvider extends ChangeNotifier {
  final IResourceService reqresService;
  List<Data> resources = [];
  bool isLoading = false;
  ReqresProvider(this.reqresService) {
    _fetch();
  }
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItems())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
