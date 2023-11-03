enum LottieItems { themechange }

extension LottieItemsExtension on LottieItems {
  String path() {
    switch (this) {
      case LottieItems.themechange:
        return "lottie_theme_change";
    }
  }

  String get lottiePath => 'assets/lottie/${path()}.json';
}
