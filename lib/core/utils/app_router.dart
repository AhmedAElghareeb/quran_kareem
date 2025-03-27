import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_kareem/core/utils/app_routes.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/layout/layout_screen.dart';
import 'package:quran_kareem/src/presentations/views/start_views/splash/cubit/splash_cubit.dart';
import 'package:quran_kareem/src/presentations/views/start_views/splash/splash_screen.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SplashCubit()..onInitializeSplash(),
            child: SplashScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.layout:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Unknown Route'),
            ),
          ),
          settings: settings,
        );
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(String initialRoute) {
    if (initialRoute == AppRoutes.splash) {
      return [
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SplashCubit()..onInitializeSplash(),
            child: SplashScreen(),
          ),
          settings: RouteSettings(name: initialRoute),
        ),
      ];
    } else if (initialRoute == AppRoutes.layout) {
      return [
        MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
          settings: RouteSettings(name: initialRoute),
        ),
      ];
    } else {
      return Navigator.defaultGenerateInitialRoutes(
        NavigatorState(),
        initialRoute,
      );
    }
  }
}
