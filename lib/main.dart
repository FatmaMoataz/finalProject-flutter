import 'package:flutter/material.dart';
import 'package:task4/add_item/item_model.dart';
import 'package:task4/authentication/login/login_model.dart';
import 'package:task4/authentication/login/login_screen.dart';
import 'package:task4/authentication/signup/signup_model.dart';
import 'package:task4/dashboard/navbar.dart';
import 'package:task4/favorite/favorite_model.dart';
import 'package:task4/profile/user_model.dart';
import 'package:task4/authentication/signup/signup_screen.dart';
import 'package:task4/splash/splash_screen.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(
    

MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => UserModel()),
    ChangeNotifierProvider(create: (context) => ItemModel()),
    ChangeNotifierProvider(create: (context) => FavoriteModel()),
    ChangeNotifierProvider(create: (context) => LoginModel()),
    ChangeNotifierProvider(create: (context) => SignupModel()),
  ],
  child: const MyApp(),
)


    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
         '/signup': (context) => const SignupScreen(),
         '/login': (context) => const LoginScreen(),
          '/navbar': (context) => const Navbar(),
  },
            debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
