import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

class NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }
    final routes = routeSettings.name == NavigatorRoutes.paraf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigatorHomeView());
      case NavigateRoutes.detail:
        final id = routeSettings.arguments;
        return _navigateToNormal(NavigatorHomeDetailView(id: id is String ? id : null), isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(fullscreenDialog: isFullScreenDialog ?? false, builder: (context) => child);
  }
}
