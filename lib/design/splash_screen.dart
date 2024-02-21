import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/article_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<void> _dataInitialization;

  @override
  void initState() {
    _dataInitialization = initData();
    super.initState();
  }

  Future<void> initData() async {
    await Provider.of<ArticleProviders>(context, listen: false).getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _dataInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Once data is loaded, navigate to the next page
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.onBoard, (route) => false);
          });
          // Return a placeholder widget while navigating
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kBlackColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
