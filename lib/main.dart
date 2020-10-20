import 'package:flutter/material.dart';
import 'package:jobby/Screens/Signin_Screen.dart';
import 'package:jobby/Screens/Signup_Screen.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/providers/jobs.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: SigninScreen.route,
        theme: ThemeData(fontFamily: 'Montserrat'),
        initialRoute: '/',
        routes: {
          '/': (context) => Router(),
          '/login': (context) => SigninScreen(),
          '/register': (context) => SignupScreen(),
          // '/password-reset': (context) => PasswordReset(),
        },
        // routes: {
        //   SignupScreen.route: (context) => SignupScreen(),
        //   SigninScreen.route: (context) => SigninScreen(),
        // },
      ),
    );
  }
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        print(user.status);
        switch (user.status) {
          case Status.Uninitialized:
            return SigninScreen();
          case Status.Unauthenticated:
            return SigninScreen();
          case Status.Authenticated:
            return ChangeNotifierProvider(
              create: (context) => JobProvider(authProvider),
              child: Container(
                child: Center(
                  child: Text("Jobs"),
                ),
              ),
            );
          default:
            return SigninScreen();
        }
      },
    );
  }
}
