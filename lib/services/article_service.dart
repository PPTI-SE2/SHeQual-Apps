import 'dart:convert';

import 'package:shequal/models/article_model.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  String baseUrl = "http://192.168.1.11:8000/api";

  Future<List<ArticleModel>> getArticle() async {
    var url = Uri.parse("$baseUrl/articles");

    var headers = {
      'content-type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if(response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ArticleModel> articles = [];

      for (var item in data) {
        articles.add(ArticleModel.fromJson(item));
      }

      return articles;
    }

    throw Exception("Gagal Get Article");
  }
}