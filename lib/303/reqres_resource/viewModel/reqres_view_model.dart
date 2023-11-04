import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqres_resource/view/reqres_view.dart';
import 'package:flutter_application_1/product/service/projectDio.dart';
import 'package:flutter_application_1/product/service/project_network_manager.dart';

abstract class ReqresViewModel extends State<ReqResView> with ProjectDioMixin {
  late final IResourceService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ResourceService(dio: ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken("1234");
    _fetch();
  }

  Future<void> _fetch() async {
    resources = (await reqresService.fetchResourceItems())?.data ?? [];
    setState(() {});
  }
}
