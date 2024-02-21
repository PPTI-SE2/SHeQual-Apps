class ArticleModel {
  String? id;
  String? publisher;
  String? content;
  String? imgArticles;
  DateTime? createdAt;
  DateTime? updatedAt;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    publisher = json["publisher"];
    content = json["content"];
    imgArticles = json["img_articles"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'publisher' : publisher,
      'content': content,
      'imgArticles' : imgArticles,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } 
}