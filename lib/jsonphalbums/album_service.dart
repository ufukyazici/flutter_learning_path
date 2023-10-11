import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/jsonphalbums/album_comment_model.dart';
import 'package:flutter_application_1/jsonphalbums/album_model.dart';

abstract class IAlbumService {
  Future<List<AlbumModel>?> getAlbums();
  Future<List<AlbumCommentModel>?> getComments(int postId);
}

class AlbumService implements IAlbumService {
  final Dio _dio;
  AlbumService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<List<AlbumModel>?> getAlbums() async {
    final response = await _dio.get('photos');
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        return datas.map((e) => AlbumModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<AlbumCommentModel>?> getComments(int postId) async {
    final response =
        await _dio.get("comments", queryParameters: {"postId": postId});
    print(response.statusCode);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => AlbumCommentModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
