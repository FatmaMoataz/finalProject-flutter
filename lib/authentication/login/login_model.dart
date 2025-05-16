import 'package:flutter/material.dart';
import '/authentication/service.dart';

class LoginModel extends ChangeNotifier { 

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

  bool result = await LocalAuthService().login(_email, _password);

  _isLoading = false;
  if (result) {
    _isLoggedIn = true;
    print('Login successful');
  } else {
    _isLoggedIn = false;
    print('Invalid email or password');
  }
  notifyListeners();
}


  Future<void> logout() async {
    await LocalAuthService().clearUser();
    _isLoggedIn = false;
    notifyListeners();
  }
}
