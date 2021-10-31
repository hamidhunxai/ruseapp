import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ruse/model/user_details.dart';
import 'package:ruse/screens/FrontScreen.dart';

class LoginController with ChangeNotifier {
  //object
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  //function for google login

  googleLogin() async {
    googleSignInAccount = await _googleSignIn.signIn();

    //insert values to our user details model

    userDetails = UserDetails(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photoURL: googleSignInAccount!.photoUrl,
    );
    //call
    notifyListeners();
  }

  // function for facebook login
  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    //check the status of our login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      this.userDetails = new UserDetails(
        displayName: requestData["name"],
        email: requestData["email"],
        photoURL: requestData["picture"]["data"]["url"] ?? " ",
      );

      notifyListeners();
    }
    //logout
  }

  logout() async {
    googleSignInAccount = await _googleSignIn.signOut();
    await FacebookAuth.i.logOut();
    userDetails = null;
    notifyListeners();
  }
}
