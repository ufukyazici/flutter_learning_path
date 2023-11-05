import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const _paraf = "/";
  final items = {
    _paraf: (context) => const LottieLearn(),
    NavigateRoutes.home.getRoutePath: (context) => const NavigatorHomeView(),
    NavigateRoutes.detail.getRoutePath: (context) => const NavigatorHomeDetailView(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigatorRoutesEnumExtension on NavigateRoutes {
  String get getRoutePath => "/$name";
}
