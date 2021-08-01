import 'package:flutter/material.dart';
import 'package:my_music_player_app/splashscreen.dart';

import 'core/resources/string.dart';
import 'feature/home/presentation/screen/homescreen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => SplashScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case homeRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => HomeScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
