import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({super.key});

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

class _SharedContextLearnState extends State<SharedContextLearn> {
  final storage = const FlutterSecureStorage();
  final TextEditingController _controller = TextEditingController();
  String _title = "";
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  Future<void> getItem() async {
    _title = await storage.read(key: _SecureKeys.token.name) ?? "";
    if (_title.isNotEmpty) {
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text("Kaydet")),
    );
  }
}

enum _SecureKeys { token }
