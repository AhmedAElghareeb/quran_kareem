import 'package:flutter/material.dart';

abstract class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static void onPush({required Widget page, dynamic arguments}) async =>
      await Navigator.of(navigatorKey.currentContext!).push(
        MaterialPageRoute(
          builder: (_) => page,
          settings: RouteSettings(arguments: arguments),
        ),
      );

  static void onPushReplacement(
      {required Widget page, dynamic arguments}) async =>
      await Navigator.of(navigatorKey.currentContext!).pushReplacement(
        MaterialPageRoute(
          builder: (_) => page,
          settings: RouteSettings(arguments: arguments),
        ),
      );

  static void onPushAndRemoveUntil(
      {required Widget page, dynamic arguments}) async =>
      Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(arguments: arguments),
        ),
            (Route<dynamic> route) => false,
      );

  static void onPop() => Navigator.pop(navigatorKey.currentContext!);

  static void onPushReplacementNamed(
      {required String route, dynamic arguments}) async =>
      await Navigator.of(navigatorKey.currentContext!).pushReplacementNamed(
        route,
        arguments: arguments,
      );

  static void onPushNamedWithContext(BuildContext context,
      {required String route, dynamic arguments}) async =>
      await Navigator.of(context).pushNamed(
        route,
        arguments: arguments,
      );

  static void onPushReplacementNamedWithContext(BuildContext context,
      {required String route, dynamic arguments}) async =>
      await Navigator.of(context).pushReplacementNamed(
        route,
        arguments: arguments,
      );

  static void onPushAndRemoveUntilNamedWithContext(BuildContext context,
      {required String route, dynamic arguments}) async =>
      Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        arguments: arguments,
            (Route<dynamic> route) => false,
      );
}