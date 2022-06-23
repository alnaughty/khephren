import 'package:flutter/material.dart';
import 'package:kprn/views/landing_page/landing_page.dart';
import 'package:kprn/views/splash_screen/splash_screen.dart';
import 'package:kprn/views/start_screen/start_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppConfig {
  AppConfig._singleton();
  static final AppConfig _instance = AppConfig._singleton();
  static AppConfig get instance => _instance;
  Route<dynamic>? Function(RouteSettings)? routes = (RouteSettings settings) {
    switch (settings.name) {
      case "/start_screen":
        return PageTransition(
          child: const StartScreenPage(),
          type: PageTransitionType.scale,
          curve: Curves.bounceOut,
          alignment: Alignment.center,
          duration: const Duration(
            milliseconds: 500,
          ),
          reverseDuration: const Duration(
            milliseconds: 500,
          ),
        );
      case "/landing_page":
        // final bool toConnect = settings.arguments as bool;
        // // if (settings.arguments == null) {
        // //   toConnect = false;
        // // } else {
        // //   toConnect = ;
        // // }
        // print(toConnect);
        return PageTransition(
          child: const LandingPage(),
          type: PageTransitionType.scale,
          curve: Curves.fastLinearToSlowEaseIn,
          alignment: Alignment.center,
          duration: const Duration(
            milliseconds: 500,
          ),
          reverseDuration: const Duration(
            milliseconds: 500,
          ),
        );
      default:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          duration: const Duration(
            milliseconds: 500,
          ),
          reverseDuration: const Duration(
            milliseconds: 500,
          ),
        );
    }
  };
}
