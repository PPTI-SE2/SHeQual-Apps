import 'package:flutter/material.dart';
import 'package:shequal/models/article_model.dart';
import 'package:shequal/services/article_service.dart';

class ArticleProviders with ChangeNotifier {
  List<ArticleModel> _articles = [];

  List<ArticleModel> get articles => _articles;

  set articles(List<ArticleModel> articles) {
    _articles = articles;
    notifyListeners();
  }

  Future<void> getArticles() async {
    try{
      List<ArticleModel> articles = await ArticleService().getArticle();
      _articles = articles;
    }catch (e) {
      print(e.toString());
    }
  }
}
