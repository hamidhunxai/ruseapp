import 'package:flutter/material.dart';
import 'package:ruse/screens/login.dart';
import 'package:ruse/screens/signUp.dart';
import 'splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.yellowAccent)),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
      routes: {
        '/login': (context) => Login(),
        '/signUp': (context) => signUp(),
      },
    );
  }
}
