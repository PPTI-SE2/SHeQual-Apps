import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shequal/models/user_model.dart';
import 'package:shequal/shared/server-config.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class AuthService {
  final UserPreferencesManager _prefsManager = UserPreferencesManager();

  Future<void> register({
    required String username,
    required String name,
    required String email,
    required int age,
    required String password,
    required String confirmPassword,
  }) async {
    var url = Uri.parse('$baseUrl/api/register');

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

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if (response.statusCode != 200) {
      throw Exception("Gagal Register");
    }

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);
    user.token = 'Bearer' + jsonDecode(response.body)['token'];
    user.poin = 100;
    // Save the user data to SharedPreferences
    await _prefsManager.saveUser(user);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/api/login');

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

    if (response.statusCode != 200) {
      throw Exception("${response.statusCode} : Gagal Login");
    }

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);
    user.token = 'Bearer' + jsonDecode(response.body)['token'];

    // Save the user data to SharedPreferences
    await _prefsManager.saveUser(user);
  }

  Future<void> logout() async {
    // Clear the user data from SharedPreferences
    await _prefsManager.removeUser();
  }

  bool isLoggedIn() {
    final user = _prefsManager.getUser();
    return user != null;
  }

  UserModel? getCurrentUser() {
    return _prefsManager.getUser();
  }


  Future<UserModel> updateProfile({
    required String? id,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/api/profile/update');

    var headers = {
      'content-type': 'application/json',
    };

    var body = json.encode({
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    if (response.statusCode != 200) {
      throw Exception("Gagal Update Profile");
    }

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    // Save the user data to SharedPreferences
    await _prefsManager.saveUser(user);

    return user;
  }
}
