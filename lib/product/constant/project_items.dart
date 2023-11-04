import 'package:dio/dio.dart';

class ProjectItems {
  ProjectItems._();
  static const String projectName = "Flutter Learning Path";
}

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio();
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();
  Dio get service => _dio;
}
