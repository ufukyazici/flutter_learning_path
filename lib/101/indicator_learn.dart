import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [_CenteredCircularIndicator()],
      ),
      body: const Column(
        children: [_CenteredCircularIndicator(), LinearProgressIndicator()],
      ),
    );
  }
}

class _CenteredCircularIndicator extends StatelessWidget {
  const _CenteredCircularIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        //value: 0.9,
        backgroundColor: Colors.white,
      ),
    );
  }
}
