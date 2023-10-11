import 'package:flutter/material.dart';
import 'package:flutter_application_1/jsonphalbums/album_language.dart';
import 'package:flutter_application_1/jsonphalbums/album_model.dart';
import 'package:flutter_application_1/jsonphalbums/album_service.dart';
import 'package:flutter_application_1/jsonphalbums/comment_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  List<AlbumModel>? _items;
  late IAlbumService service;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    service = AlbumService();
    fetchData();
  }

  void updateLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchData() async {
    updateLoading();
    _items = await service.getAlbums();
    updateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AlbumLanguage().homePage),
      ),
      body: ListView.builder(
        itemCount: _items?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CommentsPage(
                      postId: index,
                    );
                  },
                ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(_items?[index].url ?? ""),
                      Text(
                        _items?[index].title ?? "",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
