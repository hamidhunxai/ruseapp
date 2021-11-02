import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ruse/components/RoundedButton.dart';
import 'package:ruse/components/animatedR.dart';
import 'package:ruse/components/box.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/components/progressDialog.dart';
import 'package:ruse/controllers/login_controller.dart';
import 'package:ruse/controllers/main_controller.dart';
import 'package:ruse/screens/ForgetScreen.dart';

import 'package:ruse/screens/FrontScreen.dart';
import 'package:ruse/screens/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  static String id = "SignIn";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;

  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedRuse(controller: controller),
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
            TextButton(
              style: ButtonStyle(alignment: Alignment.topRight),
              child: Text(
                'FORGOT PASSWORD ?',
                style: kTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ForgetPassword.id);
              },
            ),
            Box(),
            RoundedButton(
                title: 'Login',
                colour: kPrimaryColor,
                onPressed: () {
                  if (!email.contains("@")) {
                    displayToastMessage("email address is Valid", context);
                  } else if (password.length < 6) {
                    displayToastMessage(
                        "password is mandatory upto 6 digits", context);
                  } else {
                    loginAndAuthenticateUser(context);
                  }
                }),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'OR SIGN IN WITH',
              style: kTextStyle.copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginUI(),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: TextButton(
                  child: Text(
                    'DON\'T HAVE AN ACCOUNT',
                    style: kTextStyle.copyWith(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      //if we are alreadylogin
      if (model.userDetails != null) {
        return Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, FrontScreen.id, (route) => false);
            },
            child: Text("continue"),
          ),
        );
      } else {
        return LoginControllers(context);
      }
    });
  }

  LoginControllers(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              try {
                final guser =
                    await Provider.of<LoginController>(context, listen: false)
                        .googleLogin();
                if (guser != null) {
                  Navigator.pushNamed(context, FrontScreen.id);
                }
              } catch (e) {
                print(e);
              }
            },
            icon: Icon(
              Icons.email_rounded,
              size: 40.0,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<LoginController>(context, listen: false)
                  .facebooklogin();
            },
            icon: Icon(
              Icons.facebook_rounded,
              size: 40.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

void loginAndAuthenticateUser(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          message: "Authenticating Please Wait",
        );
      });

  try {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    displayToastMessage(
      "congratulation your successfully Sign In",
      context,
    );
    // ignore: unnecessary_null_comparison
    if (user != null) {
      Navigator.pushNamed(context, FrontScreen.id);
    }
  } catch (e) {
    if (!email.contains("@")) {
      displayToastMessage(
        "Please Enter Valid Email",
        context,
      );
    } else if (password.length < 6) {
      displayToastMessage("password must be at least 6 character", context);
    } else {
      displayToastMessage(
          " No Record for this user Please Create New Account", context);
    }
  }
}