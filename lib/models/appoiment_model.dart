class AppoimentModel {
  String? id;
  String? date;
  String? time;
  String? consultant;
  String? message;
  String? status;
  int? isBayar;

  AppoimentModel({
    required this.id,
    required this.date,
    required this.time,
    required this.consultant,
    required this.message,
    required this.status,
    required this.isBayar,
  });

  AppoimentModel.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    date = json["date"];
    time = json["time"];
    consultant = json["consultant"];
    message = json["message"];
    status = json["status"];
    isBayar = json["isBayar"];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'date': date,
      'time': time,
      'consultant': consultant,
      'message' : message,
      'status' : status,
      'isBayar' : isBayar,
    };
  } 
}