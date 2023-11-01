import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart';

abstract class IResourceService {
  IResourceService({required this.dio});

  final Dio dio;
  Future<ResourceModel?> fetchResourceItems();
}

class ResourceService extends IResourceService {
  ResourceService({required super.dio});

  @override
  Future<ResourceModel?> fetchResourceItems() async {
    final response = await dio.get('/${_ReqResPath.unknown.name}');
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

enum _ReqResPath { unknown }
