class UserModel {
  String? id;
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
    required this.id,
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
    try {
      id = json["id"].toString();
      username = json['username'].toString();
      age = int.parse(json["age"].toString());
      email = json['email'].toString();
      imgProfile = json['img_profile'].toString();
      poin = int.parse(json['poin'].toString());
      createdAt = json["created_at"].toString();
      updatedAt = json["updated_at"].toString();
      token = json['token'].toString();
    } catch (e, stackTrace) {
      print('Error parsing JSON in UserModel.fromJson: $e\n$stackTrace');
      // Optionally, you can re-throw the exception to handle it elsewhere
      // rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'age': age,
      'email': email,
      'img_profile': imgProfile,
      'poin': poin,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
    };
  }

}