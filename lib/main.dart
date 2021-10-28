import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/screens/FrontScreen.dart';
import 'package:ruse/screens/login.dart';
import 'package:ruse/screens/signUp.dart';
import 'splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Ruse());
}

class Ruse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Login.id: (context) => Login(),
        SignUp.id: (context) => SignUp(),
        FrontScreen.id: (context) => FrontScreen(),
      },
    );
  }
}
