import 'package:flutter/material.dart';
import 'package:task4/authentication/service.dart';


class UserProvider with ChangeNotifier {
  final LocalAuthService _authService = LocalAuthService();

  String _name = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _isLoggedIn = false;


  String get name => _name;
  String get email => _email;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;


  Future<void> loadUser() async {
    _isLoading = true;
    notifyListeners();

    final userData = await _authService.getUser();
    _name = userData['name'] ?? '';
    _email = userData['email'] ?? '';
    _password = userData['password'] ?? '';
    _isLoggedIn = await _authService.getLoginStatus();

    _isLoading = false;
    notifyListeners();
  }


  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _authService.login(email, password);

    _isLoading = false;
    if (success) {
      _email = email;
      _password = password;
      _isLoggedIn = true;
    }
    notifyListeners();
    return success;
  }


  Future<bool> signup(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _authService.saveUser(name, email, password);

    _isLoading = false;
    if (success) {
      _name = name;
      _email = email;
      _password = password;
      _isLoggedIn = true;
    }
    notifyListeners();
    return success;
  }


  Future<void> logout() async {
    await _authService.clearUser();
    _name = '';
    _email = '';
    _password = '';
    _isLoggedIn = false;
    notifyListeners();
  }


  Future<void> updateName(String name) async {
    bool success = await _authService.updateUser(name: name);
    if (success) {
      _name = name;
      notifyListeners();
    }
  }
  Future<void> updateEmail(String email) async {
    bool success = await _authService.updateUser(email: email);
    if (success) {
      _email = email;
      notifyListeners();
    }
  }
}
