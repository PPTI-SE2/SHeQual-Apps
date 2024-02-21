import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shequal/models/user_model.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class AuthService {
  String baseUrl = "http://192.168.130.163:8000/api";
  final UserPreferencesManager _prefsManager = UserPreferencesManager();

  Future<void> register({
    required String username,
    required String name,
    required String email,
    required int age,
    required String password,
    required String confirmPassword,
  }) async {
    var url = Uri.parse('$baseUrl/register');

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

    // Save the user data to SharedPreferences
    await _prefsManager.saveUser(user);
  }

  Future<void> login({
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
}
