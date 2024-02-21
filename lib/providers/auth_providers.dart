import 'package:flutter/material.dart';
import 'package:shequal/models/user_model.dart';
import 'package:shequal/services/auth_service.dart';
import 'package:shequal/shared/user_preference_manager.dart';

class AuthProviders with ChangeNotifier {
  late UserModel _userModel;
  final AuthService _authService = AuthService();
  final UserPreferencesManager userPreferencesManager;

  AuthProviders({
    required this.userPreferencesManager,
  });

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
      await _authService.register(
        username: username,
        name: name,
        email: email,
        age: age,
        password: password,
        confirmPassword: confirmPassword,
      );

      return await login(email: email, password: password);
    } catch (e) {
      print(e.toString());

      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password cannot be empty");
      }

      await _authService.login(
        email: email,
        password: password,
      );

      // After successful login, update the _userModel
      UserModel? user = _authService.getCurrentUser();
      if (user != null) {
        _userModel = user;
        // Save the user data to SharedPreferences
        await userPreferencesManager.saveUser(user);
      }

      return true;
    } catch (e) {
      print(e.toString());

      return false;
    }
  }

  void logout() {
    _authService.logout();
  }

  bool isLoggedIn() {
    return _authService.isLoggedIn();
  }
}
