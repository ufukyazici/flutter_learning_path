import 'package:dio/dio.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio();
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();
  Dio get service => _dio;
}
