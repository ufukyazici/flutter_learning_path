import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});
  final String title = "Food";
  final String addCart = "Add to cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: PaddingUtility().paddingAll8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // sizedbox ile sarmalayıp mediaquery.of sizewidth ile ekrana yatay şekilde sıkıştırılabilir.
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _CustomFoodButton(title: addCart, onPressed: () {})),
            const SizedBox(height: 100),
            _CustomFoodButton(title: title, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _CustomFoodButton extends StatelessWidget {
  const _CustomFoodButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtils().buttonColor,
            shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: PaddingUtility().paddingAll16,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorUtils().buttonTextColor,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class PaddingUtility {
  final EdgeInsets paddingAll16 = const EdgeInsets.all(16);
  final EdgeInsets paddingAll8 = const EdgeInsets.all(8);
}

class ColorUtils {
  final Color buttonTextColor = Colors.white;
  final Color buttonColor = Colors.red;
}
