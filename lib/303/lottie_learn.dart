import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Lottie.network("https://lottie.host/6790d1e3-947f-43be-8b20-2e085c04593e/30adNGWOvk.json")),
    );
  }
}
