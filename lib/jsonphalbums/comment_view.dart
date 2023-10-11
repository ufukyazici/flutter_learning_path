import 'package:flutter/material.dart';
import 'package:flutter_application_1/jsonphalbums/album_comment_model.dart';
import 'package:flutter_application_1/jsonphalbums/album_language.dart';
import 'package:flutter_application_1/jsonphalbums/album_service.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, this.postId});
  final int? postId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<AlbumCommentModel>? _comments;
  late IAlbumService service;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    service = AlbumService();
    getComments();
  }

  void _updateLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> getComments() async {
    _updateLoading();
    _comments = await service.getComments(widget.postId ?? 1);
    _updateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AlbumLanguage().commentsPage),
      ),
      body: ListView.builder(
        itemCount: _comments?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                  "https://w7.pngwing.com/pngs/404/51/png-transparent-unknown-user-avatar-profile-person-account-human-general-pack-icon.png"),
              title: Text(_comments?[index].email ?? ""),
              subtitle: Text(_comments?[index].body ?? ""),
            ),
          );
        },
      ),
    );
  }
}
