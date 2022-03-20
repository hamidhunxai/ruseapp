import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruse/controllers/main_controller.dart';
import 'package:ruse/screens/components/boxAndButtons.dart';
import 'package:ruse/screens/components/constants.dart';
import 'package:ruse/screens/components/progress_dialog.dart';
import '../topScreens/main_screen.dart';
import '../topScreens/sign_up.dart';

class ProfileSettings extends StatefulWidget {
  static String id = "ProfileSettings";
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String? userName;
  String? uid;
  String? email;
  String? phone;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Profile Setting',
                    textAlign: TextAlign.center,
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
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  // Figma Flutter Generator TextWidget - TEXT
                ],
              ),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  userName = value;
                },
                decoration: InputDecoration(
                  hintText: 'Update your UserName',
                ),
              ),
              HeightBox25(),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Update your phone Number',
                ),
              ),
              HeightBox25(),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Update your email',
                ),
              ),
              HeightBox25(),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Update your Password',
                ),
              ),
              HeightBox25(),
              RoundedButton(
                title: 'Update Profle',
                colour: kPrimaryColor,
                onPressed: () {
                  if (!email!.contains("@")) {
                    displayToastMessage("email address is Valid", context);
                  } else if (password.length < 6) {
                    displayToastMessage(
                        "password is mandatory upto 6 digits", context);
                  } else {
                    UpdateProfile(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/R.gif',
            fit: BoxFit.contain,
            height: 42,
          ),
          Image.asset(
            "assets/images/use.png",
            height: 42,
          ),
          Container(padding: const EdgeInsets.all(8.0))
        ],
      ),
      backgroundColor: kSecondaryColor,
    );
  }

  fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('user')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.get('userName');
        email = ds.get('email');
        phone = ds.get('phone');
        print(userName);
      }).catchError((e) {
        print(e);
      });
  }
}

void UpdateProfile(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ProgressDialog(
          message: "Authenticating Please Wait",
        );
      });

  try {
    final authResult =
        EmailAuthProvider.credential(email: email, password: password);

    displayToastMessage(
      "congratulation your account has been created",
      context,
    );

    // ignore: unnecessary_null_comparison
    if (authResult != null) {
      Navigator.pushNamed(context, MainScreen.id);
    }
  } catch (e) {
    if (!email.contains("@")) {
      displayToastMessage(
        "email address is Not Valid Must Contain @",
        context,
      );
    } else if (password.length < 6) {
      displayToastMessage("password must be at least 6 character", context);
    } else {
      //error occured
      Navigator.pop(context);
      displayToastMessage("User Exist or Error", context);
    }
  }
}
