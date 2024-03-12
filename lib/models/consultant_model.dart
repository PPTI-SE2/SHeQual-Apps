class ConsultantModel {
  String? id;
  String? usersId;
  String? patients;
  String? experience;
  String? bioData;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ConsultantModel({
    required this.id,
    required this.usersId,
    required this.patients,
    required this.experience,
    required this.bioData,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  ConsultantModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    usersId = json["users_id"];
    patients = json["patients"];
    experience = json["experience"];
    bioData = json["bio_data"];
    status = json["status"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users_id': usersId,
      'patients': patients,
      'experience': experience,
      'bio_data': bioData,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}