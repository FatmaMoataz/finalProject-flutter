import 'package:flutter/material.dart';
import 'package:task4/authentication/service.dart';

class LoginModel with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _isLoggedIn = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    bool success = await LocalAuthService().login(_email, _password);

    _isLoading = false;
    _isLoggedIn = success;
    notifyListeners();

    if (success) {
      print('Login successful');
    } else {
      print('Login failed');
    }
  }
}
