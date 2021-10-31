import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/RoundedButton.dart';
import 'package:ruse/components/box.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/screens/FrontScreen.dart';
import 'package:ruse/screens/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  static String id = "SignUp";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  late String name;
  late String phone;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            Box(),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'SIGN UP',
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
            ),
            TextField(
              style: TextStyle(color: kTextColor),
              keyboardType: TextInputType.name,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your Name',
              ),
            ),
            Box(),
            TextField(
              style: TextStyle(color: kTextColor),
              keyboardType: TextInputType.phone,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your phone Number',
              ),
            ),
            Box(),
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
            TextField(
              style: TextStyle(color: kTextColor),
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your Password',
              ),
            ),
            Box(),
            RoundedButton(
              title: 'Register',
              colour: kPrimaryColor,
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
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
            Expanded(
              child: TextButton(
                child: Text(
                  'ALREADY HAVE AN ACCOUNT',
                  style: kTextStyle.copyWith(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignIn.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
