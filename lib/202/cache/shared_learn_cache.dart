import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';
import 'package:flutter_application_1/202/cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStateful<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> users;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
    users = Users().users;
  }

  Future<void> _initialize() async {
    await _manager.init();
    getCaches();
  }

  Future<void> getCaches() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? "");
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
        actions: [isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
          FloatingActionButton(onPressed: () {
            // _manager.saveStringItems(SharedKeys.users);
          })
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.delete),
    );
  }
}

abstract class LoadingStateful<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class Users {
  late final List<User> users;
  Users() {
    users = [
      User(name: "xd", description: "description", url: "xd.com"),
      User(name: "xd1", description: "description1", url: "xd1.com"),
      User(name: "xd2", description: "description2", url: "xd2.com")
    ];
  }
}
