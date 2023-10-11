import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comment_learn_view.dart';
import 'package:flutter_application_1/202/service/post_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  late IPostService postService;
  List<PostModel>? _items;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchPostItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    _items = await postService.fetchPostItems();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator() : const SizedBox()],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _CardWidget(items: _items?[index]);
        },
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    required PostModel? items,
  }) : _items = items;

  final PostModel? _items;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return CommentLearnView(
                postId: _items?.id,
              );
            },
          ));
        },
        title: Text(_items?.title ?? ""),
        subtitle: Text(_items?.body ?? ""),
      ),
    );
  }
}
