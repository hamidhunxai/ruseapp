// ignore: camel_case_types
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Scaffold(
          backgroundColor: Color.fromRGBO(26, 30, 31, 0.949999988079071),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/beaut.png"),
                fit: BoxFit.cover,
              ),
            ),
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
                  color: Color.fromRGBO(255, 255, 255, 1),
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
