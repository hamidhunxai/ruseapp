import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/rounded_button.dart';
import 'package:ruse/components/box.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/components/logo.dart';
import 'package:ruse/controllers/main_controller.dart';
import 'package:ruse/screens/sign_up.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);
  static String id = "ForgetPassword";

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Box(),
            Column(
              children: [
                Logo(),
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
                onPressed: () async {
                  try {
                    await _auth.sendPasswordResetEmail(email: email);
                    displayToastMessage(
                      "congratulation your successfully Sign In",
                      context,
                    );
                    {
                      Navigator.of(context).pop();
                    }
                    // ignore: unnecessary_null_comparison

                  } catch (e) {
                    if (!email.contains("@")) {
                      displayToastMessage(
                        "Please Enter Valid Email",
                        context,
                      );
                    }

                    displayToastMessage(
                        " No Record for this user Please Create New Account",
                        context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
