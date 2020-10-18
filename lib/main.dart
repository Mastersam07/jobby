import 'package:flutter/material.dart';
import 'package:jobby/Screens/Signin_Screen.dart';
import 'package:jobby/Screens/Signup_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignupScreen.route,
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: {
        SignupScreen.route : (context) => SignupScreen(),
        SigninScreen.route : (context) => SigninScreen(),
      },
    );
  }
}


