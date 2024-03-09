class CommentModel {
  String? id;
  String? usersId;
  String? imgProfile;
  String? postsId;
  String? username;
  String? details;
  String? createdAt;
  String? updatedAt;

  CommentModel({
    required this.id,
    required this.usersId,
    required this.username,
    required this.imgProfile,
    required this.postsId,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    usersId = json["users_id"].toString();
    username = json["username"];
    imgProfile = json["img_profile"];
    postsId = json["posts_id"];
    details = json["details"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "users_id": usersId,
      "username": username,
      "img_profile": imgProfile,
      "posts_id": postsId,
      "details": details,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
