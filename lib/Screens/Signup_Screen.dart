import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobby/Screens/Signin_Screen.dart';
import 'package:jobby/Widgets/Custom_Textfield.dart';
import 'package:jobby/Widgets/Main_Button.dart';
import 'package:jobby/constants.dart';

class SignupScreen extends StatefulWidget {
  static String route = 'Signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          body: Container(
            color: lightBlue,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                //Add app icon
                SizedBox(height: size.height*0.15,),
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
                SizedBox(height: size.height*0.1,),
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
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined, color: darkGrey,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: CustomTextField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline, color: darkGrey,),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MainActionButton(
                            onPressed: () {},
                            label: 'SignUp',
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
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SignUp with',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: darkGrey,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              'assets/images/search.png',
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height*0.1,),
                Column(
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
                            style: TextStyle(fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, SigninScreen.route);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
