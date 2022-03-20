import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ruse/controllers/main_controller.dart';
import 'package:ruse/model/users.dart';
import 'package:ruse/screens/topScreens/main_screen.dart';
import 'package:ruse/screens/topScreens/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/boxAndButtons.dart';
import '../components/constants.dart';
import '../components/logo.dart';
import '../components/progress_dialog.dart';

final _auth = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  static String id = "SignUp";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
          child: Column(
            children: [
              HeightBox25(),
              Column(
                children: [
                  Logo(),
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
              TextField(
                style: TextStyle(color: kTextColor),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  userName = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your UserName',
                ),
              ),
              HeightBox25(),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                style: TextStyle(color: kTextColor),
                keyboardType: TextInputType.phone,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your phone Number',
                ),
              ),
              HeightBox25(),
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
              HeightBox25(),
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
              HeightBox25(),
              RoundedButton(
                title: 'Register',
                colour: kPrimaryColor,
                onPressed: () {
                  if (!email.contains("@")) {
                    displayToastMessage("email address is Valid", context);
                  } else if (password.length < 6) {
                    displayToastMessage(
                        "password is mandatory upto 6 digits", context);
                  } else {
                    signUpAndAuthenticateUser(context);
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
      ),
    );
  }
}

void signUpAndAuthenticateUser(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          message: "Authenticating Please Wait",
        );
      });

  try {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User? updateUser = FirebaseAuth.instance.currentUser;
    updateUser!.uid;
    UserModel(updateUser.uid, userName, email)
        .updateUserInfo(userName, email, phone);
    displayToastMessage(
      "congratulation your account has been created",
      context,
    );

    // ignore: unnecessary_null_comparison
    if (newUser != null) {
      Navigator.pushNamed(context, MainScreen.id);
    }
  } catch (e) {
    if (!email.contains("@")) {
      displayToastMessage(
        "email address is Not Valid Must Contain @",
        context,
      );
    } else if (password.length < 6) {
      displayToastMessage("password must be at least 6 character", context);
    } else {
      //error occured
      Navigator.pop(context);
      displayToastMessage("User Exist or Error", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
