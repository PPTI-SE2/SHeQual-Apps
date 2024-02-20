import 'package:shequal/models/user_model.dart';

class PostModel {
  String? id;
  String? usersId;
  String? title;
  String? content;
  String? imgPost;
  String? createdAt;
  String? updatedAt;
  UserModel? userModel;

  PostModel({
    required this.id,
    required this.usersId,
    required this.title,
    required this.content,
    required this.imgPost,
    required this.createdAt,
    required this.updatedAt,
    // this.userModel,
  });

  // TODO: Create Usermodel at postmodel
  PostModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    usersId = json["users_id"].toString();
    title = json["title"];
    content = json["content"];
    imgPost = json["img_post"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users_id': usersId,
      'title': title,
      'content': content,
      'img_post': imgPost,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
