import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorKey.currentState?.pushNamed(route.getRoutePath, arguments: arguments);
  }
}
