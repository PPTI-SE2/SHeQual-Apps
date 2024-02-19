import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/article_providers.dart';
import 'package:shequal/providers/auth_providers.dart';
import 'package:shequal/routes/app_routes.dart';
import 'package:shequal/shared/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initData();
    Timer(
      const Duration(milliseconds: 1000),
      () {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.onBoard, (route) => false);
      }
    );
    super.initState();
  }

  initData() async {
    await Provider.of<ArticleProviders>(context, listen: false).getArticles();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kBlackColor    
          ),
        ),
      ),
    );
  }
}