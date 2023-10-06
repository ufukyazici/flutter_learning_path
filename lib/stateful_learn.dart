import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/customer_hello_button.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({super.key});

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
  int _value = 0;
  void _updateValue(bool increment) {
    if (increment) {
      _value++;
    } else {
      _value--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      body: Center(
        child: Column(
          children: [Text(_value.toString()), const CustomerHello()],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_incrementButton(), _deincrementButton()],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateValue(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: FloatingActionButton(
        onPressed: () {
          _updateValue(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
