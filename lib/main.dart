import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/controllers/login_controller.dart';

import 'package:ruse/screens/forget_screen.dart';
import 'package:ruse/screens/main_screen.dart';
import 'package:ruse/screens/sign_in.dart';
import 'package:ruse/screens/sign_up.dart';

import 'bgremover/filters.dart';
import 'bgremover/final_design.dart';
import 'bgremover/save_image.dart';

import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Ruse());
}

class Ruse extends StatelessWidget {
  File? image;

  String? path;
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
          MainScreen.id: (context) => MainScreen(),
          // MyApp.id: (context) => MyApp(),
          // ImagePainterExample.id: (context) => ImagePainterExample(),

          SelectBottomPanel.id: (context) => SelectBottomPanel(),
          FilterRuse.id: (context) => FilterRuse(),
          PhotoEditor.id: (context) => PhotoEditor(
                arguments: [],
              ),
        },
      ),
    );
  }
}
