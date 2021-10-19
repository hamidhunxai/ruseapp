import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login4Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Login4Widget - FRAME
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color.fromRGBO(26, 30, 31, 0.949999988079071),
          body: Container(),
        ),
        Column(
          children: [
            Center(
              child: Expanded(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'SIGN IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                    color: Color.fromRGBO(54, 131, 115, 1),
                  ),
                ),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a User Name',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Password',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                // Figma Flutter Generator TextWidget - TEXT
                Container(
                  width: 400.0,
                  alignment: Alignment.topRight,
                  child: Text(
                    'FORGOT Password?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Lato',
                        fontSize: 12,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 2.5833333333333335),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(54, 131, 115, 1), // background
                    padding: EdgeInsets.only(
                        left: 170.0, right: 150.0, top: 20.0, bottom: 20.0),
                    alignment: Alignment.center,
                    onPrimary: Colors.white,
                    // foreground
                  ),
                  onPressed: () {},
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
