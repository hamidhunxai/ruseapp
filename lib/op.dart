import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SplashWidget - FRAME
    return Stack(
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
              "assets/images/logo.png",
              width: 300.0,
            )),
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
              'Background Changer',
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
    );
  }
}
