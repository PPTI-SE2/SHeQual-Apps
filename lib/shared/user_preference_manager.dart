import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shequal/models/user_model.dart';

class UserPreferencesManager {
  static const _keyUser = 'user'; // Change the key

  SharedPreferences? _prefs;

  Future<void> _initPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveUser(UserModel user) async {
    await _initPreferences();
    final userJson = jsonEncode(user.toJson()); // Convert single UserModel to JSON
    await _prefs!.setString(_keyUser, userJson);
  }

  UserModel? getUser() {
    final userJson = _prefs?.getString(_keyUser);
    if (userJson != null) {
      final decodedUser = jsonDecode(userJson);
      return UserModel.fromJson(decodedUser);
    }
    return null;
  }

  Future<void> removeUser() async {
    await _initPreferences();
    await _prefs!.remove(_keyUser);
  }
}