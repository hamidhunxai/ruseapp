import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'RUSE',
            style: TextStyle(),
          ),
          backgroundColor: Color.fromRGBO(26, 30, 31, 0.949999988079071),
        ),
        body: Login4Widget(),
      ),
    );
  }
}
