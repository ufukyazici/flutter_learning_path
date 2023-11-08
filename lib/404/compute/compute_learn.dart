import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({super.key});
  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_result.toString()),
      ),
      body: Column(
        children: [
          const CircularProgressIndicator(),
          const Text('login.welcome').tr(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await compute(Calculator.sum, 1000000000);
          setState(() {
            _result = result;
          });
        },
      ),
    );
  }
}

class Calculator {
  static int sum(int limit) {
    int result = 0;
    for (var i = 0; i < limit; i++) {
      result = i * i;
    }
    return result;
  }
}
