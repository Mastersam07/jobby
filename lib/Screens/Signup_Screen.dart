import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:jobby/Screens/Signin_Screen.dart';
import 'package:jobby/Widgets/Custom_Textfield.dart';
import 'package:jobby/Widgets/Main_Button.dart';
import 'package:jobby/Widgets/custom_dialog.dart';
import 'package:jobby/constants.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/utils/validators.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static String route = 'Signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;

  String gender;
  String email;
  String password;
  String passwordConfirm;
  String message = '';

  Map response = new Map();

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        loading = true;
      });
      response = await Provider.of<AuthProvider>(context, listen: false)
          .register(gender, email, password, passwordConfirm);
      setState(() {
        loading = false;
      });
      if (response['success']) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Registration Successful",
                descriptions: "${response['message']} Kindly login",
                text: "Ok",
              );
            });
        // },
        // Navigator.pop(context);
        // Navigator.pushReplacementNamed(context, SigninScreen.route);
      } else {
        setState(() {
          message = response['message'];
        });
      }
    }
  }

  disableFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: disableFocus,
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              color: lightBlue,
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  //Add app icon
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Jobby',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: darkGrey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: CustomTextField(
                                validator: (value) {
                                  email = value.trim();
                                  return Validate.validateEmail(value);
                                },
                                // controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: darkGrey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: CustomTextField(
                                validator: (value) {
                                  password = value.trim();
                                  return Validate.requiredField(
                                      value, 'Password is required.');
                                },
                                // controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: darkGrey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: CustomTextField(
                                validator: (value) {
                                  passwordConfirm = value.trim();
                                  return Validate.requiredField(
                                      value, 'Password is required.');
                                },
                                // controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                labelText: 'Confirm Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: darkGrey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: CustomTextField(
                                validator: (value) {
                                  gender =
                                      value.trim().toString().toLowerCase();
                                  return Validate.requiredField(
                                      value, 'Gender is required.');
                                },
                                // controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                labelText: 'Gender',
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: darkGrey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            MainActionButton(
                              onPressed: submit,
                              label: loading
                                  ? Center(
                                      child: Container(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : Text(
                                      'SignUp',
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.3,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 40,
                              endIndent: 10,
                            ),
                          ),
                          Text('OR'),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 10,
                              endIndent: 40,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account?  ',
                                style: TextStyle(
                                  color: darkGrey,
                                  fontFamily: 'Montserrat',
                                ),
                                children: [
                                  TextSpan(
                                    text: 'SignIn',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, "/login");
                                      },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  // Column(
                  //   children: [
                  //     RichText(
                  //       text: TextSpan(
                  //         text: 'Already have an account?  ',
                  //         style: TextStyle(
                  //           color: darkGrey,
                  //           fontFamily: 'Montserrat',
                  //         ),
                  //         children: [
                  //           TextSpan(
                  //             text: 'SignIn',
                  //             style: TextStyle(fontWeight: FontWeight.w600),
                  //             recognizer: TapGestureRecognizer()..onTap = () {
                  //               Navigator.pushNamed(context, SigninScreen.route);
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
