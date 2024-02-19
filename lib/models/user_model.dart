class UserModel {
  String? username;
  int? age;
  String? email; 
  String? imgProfile;
  int? poin;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? token;

  UserModel({
    required this.username,
    required this.age,
    required this.email,
    required this.imgProfile,
    required this.poin,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    age = json['age'];
    email = json['email'];
    imgProfile = json['img_profile'];
    poin = json['poin'];
    createdAt = json["created_at"].toString();
    updatedAt = json["updated_at"].toString();
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'age': age,
      'email': email,
      'imgProfile': imgProfile,
      'poin': poin,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
    };
  }

}