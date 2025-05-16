import 'package:flutter/material.dart';
import 'package:task4/authentication/service.dart';

class SignupModel with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _isLoggedIn = false;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> signup() async {
    _isLoading = true;
    notifyListeners();

    bool success = await LocalAuthService().saveUser(_name, _email, _password);
    _isLoading = false;
    _isLoggedIn = success;
    notifyListeners();

    if (success) {
      print('Signup successful');
    } else {
      print('Signup failed');
    }
  }
}
