import 'package:shequal/models/comment_model.dart';

class PostModel {
  String? id;
  String? usersId;
  String? username;
  String? imgProfile;
  String? title;
  String? content;
  String? imgPost;
  int? likes;
  String? createdAt;
  String? updatedAt;
  List<CommentModel>? comments;

  PostModel({
    required this.id,
    required this.usersId,
    required this.username,
    required this.imgProfile,
    required this.title,
    required this.content,
    required this.imgPost,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.comments,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["post_id"].toString();
    usersId = json["user_id"].toString();
    username = json["username"].toString();
    imgProfile = json["img_profile"].toString();
    title = json["title"];
    content = json["content"];
    imgPost = json["img_post"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    comments = (json["comments"] != null) ? json["comments"].map<CommentModel>((comment) => CommentModel.fromJson(comment)).toList() : null;
    likes = json["likes"];
  }

  Map<String, dynamic> toJson() {
    return {
      'post_id': id,
      'user_id': usersId,
      'username': username,
      'title': title,
      'content': content,
      'img_post': imgPost,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'comments': (comments != null) ? comments!.map((comment) => comment.toJson()).toList() : null,
      'likes': likes,
    };
  }
}
