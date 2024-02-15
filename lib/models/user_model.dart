class UserModel {
  String? username;
  int? age;
  String? email; 
  String? imgProfile;
  int? poin;
  DateTime? createdAt;
  DateTime? updatedAt;
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
    username = json[username];
    age = json[age];
    email = json[email];
    imgProfile = json[imgProfile];
    poin = json[poin];
    createdAt = json[createdAt];
    updatedAt = json[updatedAt];
    token = json[token];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'age': age,
      'email': email,
      'imgProfile': imgProfile,
      'poin': poin,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'token': token,
    };
  }

}