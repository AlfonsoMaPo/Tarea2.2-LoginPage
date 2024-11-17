import 'package:flutter/material.dart';
import 'package:myapp/auth/loginpage.dart';
import 'package:myapp/auth/registrationpage.dart';
import 'package:myapp/fragments/homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}
