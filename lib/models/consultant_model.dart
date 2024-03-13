class ConsultantModel {
  String? id;
  String? usersId;
  String? name;
  String? bioData;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ConsultantModel({
    required this.id,
    required this.usersId,
    required this.name,
    required this.bioData,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  ConsultantModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    usersId = json["users_id"].toString();
    name = json["name"];
    bioData = json["bio"];
    status = json["status"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users_id': usersId,
      'name': name,
      'bio': bioData,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}