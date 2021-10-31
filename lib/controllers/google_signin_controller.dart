import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  //function for login

  login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    //call
    notifyListeners();
  }

  logout() async {
    //empty value after logout
    googleSignInAccount = await _googleSignIn.signOut();
    //call
    notifyListeners();
  }
}
