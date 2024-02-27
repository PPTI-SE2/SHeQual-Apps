import 'package:flutter/material.dart';
import 'package:shequal/design/auth/sign_in_screen.dart';
import 'package:shequal/design/auth/sign_up_screen.dart';
import 'package:shequal/design/main/articles/article_screen.dart';
import 'package:shequal/design/main/articles/details_article_screen.dart';
import 'package:shequal/design/main/home/add_post_screen.dart';
import 'package:shequal/design/main/home/detail_post_screen.dart';
import 'package:shequal/design/main/main_screen.dart';
import 'package:shequal/design/main/profile/edit_profile_screen.dart';
import 'package:shequal/design/main/search_screen.dart';
import 'package:shequal/design/onBoarding/on_boarding_screen.dart';
import 'package:shequal/design/splash_screen.dart';
import 'package:shequal/shared/user_preference_manager.dart';


class AppRoutes {
  final UserPreferencesManager userPreferencesManager;

  AppRoutes({
    required this.userPreferencesManager,
  });

  static const String root = '/';
  static const String main = '/main';
  static const String onBoard = '/onBoard';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static const String post = '/main/home/post';
  static const String addPost = '/main/home/post/add';
  static const String editProfile = '/main/profile/edit';
  static const String search = '/main/search';
  static const String articles = '/main/articles';
  
  Map<String, WidgetBuilder> get routes => {
    root: (context) => const SplashScreen(),
    main: (context) => MainScreen(userPreferencesManager: userPreferencesManager,),
    onBoard: (context) => const OnBoardingScreen(),
    signIn: (context) => SignInPage(),
    signUp: (context) => SignUpPage(),
    post: (context) => DetailPostScreen(),
    editProfile: (context) => EditProfileScreen(userPreferencesManager: userPreferencesManager,),
    search: (context) => const SearchScreen(),
    articles: (context) => const ArticleScreen(),
    addPost: (context) => const AddPostScreen(),
  };
}
