import 'package:flutter/material.dart';

class CustomerHello extends StatefulWidget {
  const CustomerHello({super.key});

  @override
  State<CustomerHello> createState() => _CustomerHelloState();
}

class _CustomerHelloState extends State<CustomerHello> {
  int _customerCount = 0;
  final _title = "Merhaba";
  void incrementCount() {
    setState(() {
      ++_customerCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: incrementCount, child: Text("$_title $_customerCount"));
  }
}
