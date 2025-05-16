import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthService {
  Future<bool> saveUser(String name, String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    return {
      'name': name ?? '',
      'email': email ?? '',
      'password': password ?? '',
    };
  }

    Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    bool isLoggedIn = (email == storedEmail && password == storedPassword);
    if (isLoggedIn) {
      await prefs.setBool('isLoggedIn', true); 
    }
    return isLoggedIn;
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

