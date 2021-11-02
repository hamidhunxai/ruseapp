import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/controllers/login_controller.dart';
import 'package:ruse/screens/ForgetScreen.dart';
import 'package:ruse/screens/FrontScreen.dart';
import 'package:ruse/screens/signIn.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: SignIn(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: kSecondaryColor),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          SignIn.id: (context) => SignIn(),
          SignUp.id: (context) => SignUp(),
          ForgetPassword.id: (context) => ForgetPassword(),
          FrontScreen.id: (context) => FrontScreen(),
        },
      ),
    );
  }
}
