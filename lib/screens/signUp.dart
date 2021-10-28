import 'package:flutter/material.dart';
import 'package:ruse/components/RoundedButton.dart';
import 'package:ruse/components/box.dart';
import 'package:ruse/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_buttons/auth_buttons.dart';

import 'FrontScreen.dart';

class SignUp extends StatefulWidget {
  static String id = "SignUp";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100.0,
              child: Image.asset('assets/images/logo.png'),
            ),
            Box(),
            Column(
              children: [
                Text(
                  'SIGN UP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'Lato',
                      fontSize: 12,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                Container(
                  width: 52,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),

                // Figma Flutter Generator TextWidget - TEXT
              ],
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            Box(),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your Password',
              ),
            ),
            Text(
              'FORGOT Password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: kTextColor,
                  fontFamily: 'Lato',
                  fontSize: 12,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.5833333333333335),
            ),
            Box(),
            Expanded(
              flex: 1,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: RoundedButton(
                  title: 'Register',
                  colour: kPrimaryColor,
                  onPressed: () async {
                    try {
                      // print(email);
                      // print(password);
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if (newUser != null) {
                        Navigator.pushNamed(context, FrontScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ),
            GoogleAuthButton(
              onPressed: () {},
              darkMode: false,
              style: AuthButtonStyle(
                iconType: AuthIconType.outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
