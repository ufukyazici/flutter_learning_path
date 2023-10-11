import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  List<CommentModel>? _items;
  late IPostService postService;
  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchComments();
  }

  Future<void> fetchComments() async {
    if (widget.postId != null) {
      _items = await postService.fetchCommentItems(widget.postId ?? 0);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: Text("${_items?[index].email}"),
          );
        },
      ),
    );
  }
}
