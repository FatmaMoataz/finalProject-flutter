import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4/add_item/item_model.dart';
import 'package:task4/authentication/login/login_model.dart';
import 'package:task4/authentication/login/login_screen.dart';
import 'package:task4/authentication/signup/signup_model.dart';
import 'package:task4/dark_theme_model/dark_theme_model.dart';
import 'package:task4/favorite/favorite_model.dart';
import 'package:task4/profile/user_model.dart';
import 'package:task4/splash/splash_screen.dart';
import 'package:task4/authentication/signup/signup_screen.dart';
import 'authentication/user_model.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => ItemModel()),
        ChangeNotifierProvider(create: (_) => FavoriteModel()),
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => SignupModel()),
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
            theme: themeProvider.darkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const SplashScreen(),
          routes: {
            '/signup': (context) => SignupScreen(),
            '/login': (context) => LoginScreen(),
          },
        );
      },
    );
  }
}

