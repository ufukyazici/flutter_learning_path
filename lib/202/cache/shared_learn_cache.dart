import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends State<SharedLearn> {
  int _currentValue = 0;
  bool _isLoading = false;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    await _manager.init();
    getCaches();
  }

  Future<void> getCaches() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? "");
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
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        _changeLoading();
      },
      child: const Icon(Icons.delete),
    );
  }
}
