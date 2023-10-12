import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool _isVisible = false;
  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems().durationLow);
  }

  @override
  Widget build(BuildContext context) {
    // Text("data", style: context.textTheme().bodyLarge)
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      // body: AnimatedCrossFade(
      //     firstChild: Container(color: Colors.red, height: 200, width: 200),
      //     secondChild: Container(color: Colors.yellow, height: 200, width: 200),
      //     crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      //     duration: _DurationItems().durationHigh),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems().durationLow,
              opacity: _isVisible ? 1 : 0,
              child: const Text("data"),
            ),
            trailing: IconButton(onPressed: _changeVisible, icon: const Icon(Icons.accessible_forward_rounded)),
          ),
          AnimatedDefaultTextStyle(
              style:
                  (_isVisible ? context.textTheme().labelLarge : context.textTheme().displayLarge) ?? const TextStyle(),
              duration: _DurationItems().durationMed,
              child: const Text('DATA')),
          AnimatedIcon(icon: AnimatedIcons.list_view, progress: controller),
          AnimatedContainer(
            duration: _DurationItems().durationLow,
            height: _isVisible ? 0 : MediaQuery.of(context).size.height * 0.2,
            width: _isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
            color: Colors.blue,
          ),
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                  top: 30, curve: Curves.easeOut, duration: _DurationItems().durationLow, child: const Text("data"))
            ],
          )),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return const Text('data');
              },
            ),
          )
        ],
      ),
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  final durationLow = const Duration(seconds: 1);
  final durationMed = const Duration(seconds: 2);
  final durationHigh = const Duration(seconds: 3);
}
