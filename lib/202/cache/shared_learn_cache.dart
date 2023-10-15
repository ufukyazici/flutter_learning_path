import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends State<SharedLearn> {
  int _currentValue = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getCaches();
  }

  Future<void> getCaches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    _onChangeValue(counter.toString());
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _onChangeValue(String value) {
    final value0 = int.tryParse(value);
    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox()],
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('counter', _currentValue);
        _changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('counter');
        _changeLoading();
      },
      child: const Icon(Icons.delete),
    );
  }
}
