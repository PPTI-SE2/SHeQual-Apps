import 'package:flutter/material.dart';
import 'package:shequal/design/auth/sign_in_screen.dart';
import 'package:shequal/design/auth/sign_up_screen.dart';
import 'package:shequal/design/main/home/detail_post_screen.dart';
import 'package:shequal/design/main/main_screen.dart';
import 'package:shequal/design/onBoarding/on_boarding_screen.dart';
import 'package:shequal/design/splah_screen.dart';


class AppRoutes {
  static const String root = '/';
  static const String main = '/main';
  static const String onBoard = '/onBoard';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static const String post = '/main/home/post';
  
  static Map<String, WidgetBuilder> routes = {
    root: (context) => const SplashScreen(),
    main: (context) => const MainScreen(),
    onBoard: (context) => const OnBoardingScreen(),
    signIn: (context) => SignInPage(),
    signUp: (context) => SignUpPage(),
    post: (context) => DetailPostScreen(),
  };
}