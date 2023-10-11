import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  bool _isLoading = false;
  late final Dio _dio;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> postData(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post("posts", data: postModel, options: Options(contentType: Headers.jsonContentType));
    if (response.statusCode == HttpStatus.created) {
      name = "Basarili";
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ""),
      ),
      body: Column(
        children: [
          TextField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              decoration: const InputDecoration(label: Text("title"))),
          TextField(
              keyboardType: TextInputType.text,
              controller: _bodyController,
              decoration: const InputDecoration(label: Text("body"))),
          TextField(
              keyboardType: TextInputType.number,
              controller: _userIdController,
              autofillHints: const [AutofillHints.creditCardNumber],
              decoration: const InputDecoration(label: Text("userId"))),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            userId: int.tryParse(_userIdController.text));
                        postData(model);
                      }
                    },
              child: const Text("Send"))
        ],
      ),
    );
  }
}
