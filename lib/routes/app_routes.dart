import 'package:flutter/material.dart';
import 'package:shequal/design/main_screen.dart';
import 'package:shequal/design/onBoarding/on_boarding_screen.dart';
import 'package:shequal/design/splah_screen.dart';


class AppRoutes {
  static const String root = '/';
  static const String main = '/main';
  static const String onBoard = '/onBoard';
  
  static Map<String, WidgetBuilder> routes = {
    root: (context) => const SplashScreen(),
    main: (context) => const MainScreen(),
    onBoard: (context) => const OnBoardingScreen(),
  };
}