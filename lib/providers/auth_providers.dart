import 'package:flutter/material.dart';
import 'package:shequal/models/user_model.dart';
import 'package:shequal/services/auth_service.dart';

class AuthProviders with ChangeNotifier {
  late UserModel _userModel;

  UserModel get user => _userModel;

  set user(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  Future<bool> register({
    required String username,
    required String name,
    required String email,
    required int age,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      UserModel user = await AuthService().register(
        username: username,
        name: name,
        email: email,
        age: age,
        password: password,
        confirmPassword: confirmPassword,
      );

      _userModel = user;

      return true;

    } catch (e) {
      print(e.toString());

      return false;
    }
  }
}
