import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == "/") {
      return _navigateToNormal(const LottieLearn());
    } else if (routeSettings.name == "/homeDetail") {
      final id = routeSettings.arguments;
      return _navigateToNormal(NavigatorHomeDetailView(id: id is String ? id : null));
    }
    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
