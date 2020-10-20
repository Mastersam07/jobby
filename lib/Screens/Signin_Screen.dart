import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:jobby/Screens/Signup_Screen.dart';
import 'package:jobby/Widgets/Custom_Textfield.dart';
import 'package:jobby/Widgets/Main_Button.dart';
import 'package:jobby/providers/auth.dart';
import 'package:jobby/utils/validators.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SigninScreen extends StatefulWidget {
  static String route = 'Signin';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  String email;
  String password;
  bool loading = false;

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      setState(() {
        loading = true;
      });
      await Provider.of<AuthProvider>(context, listen: false)
          .login(email, password);
      setState(() {
        loading = false;
      });
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
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: darkGrey,
        //     ),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: Form(
          key: _formKey,
          child: Container(
            color: lightBlue,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
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
                                    'Login',
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Create a new account  ',
                              style: TextStyle(
                                color: darkGrey,
                                fontFamily: 'Montserrat',
                              ),
                              children: [
                                TextSpan(
                                  text: 'SignUp',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, "/register");
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
                //               Navigator.pushNamed(context, SignupScreen.route);
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
    );
  }
}
