import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/screens/signIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id = "SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, SignIn.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Scaffold(
          backgroundColor: kSecondaryColor,
          body: Container(
            decoration: splashDecoration,
            margin: const EdgeInsets.only(left: 220.0),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/logo.png',
                width: 200.0,
              ),
            ),
            Expanded(
                child: Image.asset(
              "assets/images/t.png",
              width: 1000.0,
              height: 1000.0,
            )),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
                child: Text(
              'Object Manipulator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kTextColor,
                  fontFamily: 'Mukta',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            )),
          ],
        )
      ],
    ));
  }
}
