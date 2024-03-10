class AppoimentModel {
  String? id;
  String? userId;
  String? consultantId;
  String? date;
  String? day;
  String? time;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  AppoimentModel({
    required this.id,
    required this.userId,
    required this.consultantId,
    required this.date,
    required this.day,
    required this.time,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  AppoimentModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    userId = json["users_id"];
    consultantId = json["consultants_id"];
    date = json["date"];
    day = json["day"];
    time = json["time"];
    status = json["status"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'users_id' : userId,
      'consultants_id': consultantId,
      'date': date,
      'day': day,
      'time': time,
      'status' : status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } 
}