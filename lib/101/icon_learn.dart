import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  IconLearn({super.key});
  final IconSizes iconSize = IconSizes();
  final IconColors iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon Learn"),
      ),
      body: Center(
          child: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.accessible_forward_rounded,
                color: iconColors.froly,
                size: iconSize.iconSmall,
              )),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.accessible_forward_rounded,
                color: iconColors.froly,
                size: IconSizes.iconHuge,
              )),
          const SizedBox(
            height: 100,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.accessible_forward_rounded,
                color: Theme.of(context).colorScheme.background,
                size: iconSize.iconSmall,
              ))
        ],
      )),
    );
  }
}

// static yaılabilir ama kullanmasak daha iyi
// amelelik yapma böyle kullan
class IconSizes {
  final double iconSmall = 40;
  final double iconMedium = 60;
  final double iconLarge = 80;
  static const double iconHuge = 100;
}

// amelelik yapma böyle kullan
class IconColors {
  final Color froly = const Color(0xffED617A);
}
