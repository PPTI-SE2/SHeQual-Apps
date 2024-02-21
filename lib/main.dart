import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/article_providers.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/providers/post_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/user_preference_manager.dart';

void main() {
  final UserPreferencesManager userPreferencesManager = UserPreferencesManager();
  runApp(MyApp(userPreferencesManager: userPreferencesManager,));
}

class MyApp extends StatelessWidget {
  final UserPreferencesManager userPreferencesManager;
  const MyApp({super.key, required this.userPreferencesManager});

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes(userPreferencesManager: userPreferencesManager);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProviders>(
          create: (context) => PageProviders(),
        ),
        ChangeNotifierProvider<AuthProviders>(
          create: (context) => AuthProviders(userPreferencesManager: userPreferencesManager),
        ),
        ChangeNotifierProvider<ArticleProviders>(
          create: (context) => ArticleProviders(),
        ),
        ChangeNotifierProvider<PostProviders>(
          create: (context) => PostProviders(),
        ),
      ],
      child: MaterialApp(
        title: 'SHeQual',
        debugShowCheckedModeBanner: false,
        routes: appRoutes.routes,
      ),
    );
  }
}