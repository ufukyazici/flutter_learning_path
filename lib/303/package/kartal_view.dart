import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                "5337223169".ext.launchPhone;
              },
              child: Text("data", style: context.general.textTheme.displayLarge)),
          Icon(context.device.isIOSDevice ? Icons.ac_unit : Icons.accessible_forward_outlined),
          Image.network("".ext.randomImage),
        ],
      ),
    );
  }
}
