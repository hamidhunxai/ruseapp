import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ruse/components/constants.dart';
import 'package:ruse/controllers/login_controller.dart';
import 'package:ruse/screens/signIn.dart';

class FrontScreen extends StatefulWidget {
  static String id = "FrontScreen";
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushNamed(context, SignIn.id);
              }),
        ],
        title: Text('RUSE'),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: loginUI(),
      ),
    );
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      //if we are alreadylogin
      if (model.userDetails != null) {
        return Center(
          child: LoggedInUI(model),
        );
      } else {
        return TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignIn.id);
          },
          child: Text("logout"),
        );
      }
    });
  }

  LoggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      //out ui will 3 childern name, email, photo, logout
      children: [
        CircleAvatar(
            backgroundImage:
                Image.network(model.userDetails!.photoURL ?? "").image,
            radius: 50),
        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        //logout
        ActionChip(
          avatar: const Icon(Icons.logout),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).logout();
          },
          label: Text("logout"),
        ),
      ],
    );
  }
}
