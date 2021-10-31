import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ruse/components/RoundedButton.dart';
import 'package:ruse/components/box.dart';
import 'package:ruse/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  static String id = "ForgetPassword";

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _auth = FirebaseAuth.instance;

  late String email;

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
                  'SIGN IN',
                  textAlign: TextAlign.center,
                  style: kTextStyle,
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
              onChanged: (value) {
                email = value;
              },
              style: TextStyle(color: kTextColor),
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            Box(),
            Box(),
            RoundedButton(
              title: 'Send Request',
              colour: kPrimaryColor,
              onPressed: () {
                _auth.sendPasswordResetEmail(email: email);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
