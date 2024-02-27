import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shequal/models/comment_model.dart';
import 'package:shequal/models/post_model.dart';

class PostService {
  String baseUrl = "http://192.168.130.163:8000/api";

  Future<List<PostModel>> getPost() async {
    var url = Uri.parse("$baseUrl/posts");

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
      List<PostModel> posts = [];

      for (var item in data) {
        posts.add(PostModel.fromJson(item));
      }

      return posts;
    }

    throw Exception("Gagal Get Article");
  }

  Future<bool> likeUnlikePost({
    required String? idPost,
    required String? idUser,
  }) async {
    var url = Uri.parse("$baseUrl/like-unlike-post");

    var headers = {
      'content-type': 'application/json',
    };

    var body = jsonEncode({
      "posts_id": idPost,
      "users_id": idUser,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if(response.statusCode == 200) {
      print("Berhasil Like");
      return true;
    }
    else if(response.statusCode == 201) {
      print("Berhasil UnLike");
      return true;
    }

    return false;
  }

  Future<bool> checkLike({
    required String? postsId,
    required String? usersId,
  }) async {
    var url = Uri.parse("$baseUrl/check-like/$postsId/$usersId");

    var headers = {
      'content-type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);
    if(response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<PostModel?> addPost({
    required String userId,
    required String image,
    required String title,
    required String content,
  }) async {
    var url = Uri.parse("$baseUrl/posts");

    var headers = {
      'content-type': 'application/json',
    };

    var body = jsonEncode({
      'user_id': userId,
      'image': image,
      'title': title,
      'content': content,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if(response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body)["data"]);
    }

    return null;
  }  

  Future<CommentModel?> addComment({
    required String postId,
    required String userId,
    required String details,
  }) async {
    var url = Uri.parse("$baseUrl/comments");

    var headers = {
      'content-type': 'application/json',
    };

    var body = jsonEncode({
      "post_id": postId,
      "user_id": userId,
      "details": details,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      CommentModel comment = CommentModel.fromJson(data);
      print("Menambah komentar berhasil");

      return comment;
    }

    print("Gagal menambah komentar");
    return null;
  }
}