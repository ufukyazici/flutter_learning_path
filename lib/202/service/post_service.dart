import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> postData(PostModel postModel);
  Future<List<PostModel>?> fetchPostItems();
  Future<List<CommentModel>?> fetchCommentItems(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> postData(PostModel postModel) async {
    final response = await _dio.post(_PostSericePaths.posts.name,
        data: postModel, options: Options(contentType: Headers.jsonContentType));
    return (response.statusCode == HttpStatus.created);
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    final response = await _dio.get(_PostSericePaths.posts.name);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        return datas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchCommentItems(int postId) async {
    final response = await _dio.get(_PostSericePaths.comments.name, queryParameters: {'postId': postId});
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        return datas.map((e) => CommentModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum _PostSericePaths { posts, comments }
