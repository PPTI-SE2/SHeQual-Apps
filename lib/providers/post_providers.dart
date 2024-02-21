import 'package:flutter/material.dart';
import 'package:shequal/models/comment_model.dart';
import 'package:shequal/models/post_model.dart';
import 'package:shequal/services/post_service.dart';

class PostProviders with ChangeNotifier {
  List<PostModel> _articles = [];

  List<PostModel> get post => _articles;

  set post(List<PostModel> post) {
    _articles = post;
    notifyListeners();
  }

  Future<void> getPosts() async {
    try{
      List<PostModel> post = await PostService().getPost();
      _articles = post;
    }catch (e) {
      print(e.toString());
    }
  }

  Future<bool> likePost({
    required String? postsId,
    required String? usersId,
  }) async {
    try {

      if(await PostService().likeUnlikePost(idPost: postsId, idUser: usersId)) {
        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> checkLike({
    required String? postsId,
    required String? usersId,
  }) async {
    try {

      if(await PostService().checkLike(postsId: postsId, usersId: usersId)) {
        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<CommentModel?> addComment({
    required String postId,
    required String userId,
    required String details,
  }) async {
    try {
      CommentModel? comment = await PostService().addComment(postId: postId, userId: userId, details: details);
      if(comment != null) {
        return comment;
      }

    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
