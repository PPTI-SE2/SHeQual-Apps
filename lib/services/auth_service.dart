import 'dart:convert';

import 'package:shequal/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.68.101.55:8000/api';

  Future<UserModel> register({
    required String username,
    required String name,
    required String email,
    required int age,
    required String password,
    required String confirmPassword,
  }) async {
    var url = Uri.parse(
      '$baseUrl/register'
    );

    var headers = {
      'content-type': 'application/json',
    };

    var body = json.encode({
      'username': username,
      'name': name,
      'email': email,
      'age': age,
      'password': password,
      'confirm_password': confirmPassword,
    });

    print("before response");

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if(response.statusCode != 200) throw Exception("Gagal Register");

    print("Masuk sini");

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);
    user.token = 'Bearer' + data['token'];
    return user;
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    
    var headers = {
      'content-type': 'application/json',
    };

    var body = json.encode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if(response.statusCode != 200) throw Exception("${response.statusCode} :Gagal Register");

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);
    user.token = 'Bearer' + data['token'];
    return user;
  }
}