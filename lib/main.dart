import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/page_providers.dart';
import 'package:shequal/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProviders>(
          create: (context) => PageProviders(),
        )
      ],
      child: MaterialApp(
        title: 'SHeQual',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    );
  }
}