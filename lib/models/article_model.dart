class ArticleModel {
  String? id;
  String? publisher;
  String? content;
  String? title;
  String? imgArticles;
  DateTime? createdAt;
  DateTime? updatedAt;

  ArticleModel({
    required this.id,
    required this.publisher,
    required this.content,
    required this.title,
    required this.imgArticles,
    required this.createdAt,
    required this.updatedAt,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    publisher = json["publisher"];
    title = json["title"];
    content = json["content"];
    imgArticles = json["img_articles"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'publisher' : publisher,
      'title': title,
      'content': content,
      'imgArticles' : imgArticles,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } 
}