import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProviders>(
          create: (context) => PageProviders(),
        ),
        ChangeNotifierProvider<AuthProviders>(
          create: (context) => AuthProviders(),
        ),
      ],
      child: MaterialApp(
        title: 'SHeQual',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}